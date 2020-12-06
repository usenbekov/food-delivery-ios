//
//  ImageDataProvider.swift
//  FoodDelivery
//
//  Created by Altynbek Usenbekov on 6/12/20.
//

import UIKit
import Combine

protocol ImageDataProvider {
  func image(for item: MenuItem) -> AnyPublisher<UIImage, Never>
}

enum CustomErrors: String, Error {
  case unknown
  case noData
}

class DummyImageDataProvider: ImageDataProvider {
  func image(for item: MenuItem) -> AnyPublisher<UIImage, Never> {
    let ran = arc4random_uniform(6) + 1
    return Result.Publisher(UIImage(named: "dummy-\(ran)")!).eraseToAnyPublisher()
  }
}

class URLImageDataProvider: ImageDataProvider {
  func image(for item: MenuItem) -> AnyPublisher<UIImage, Never> {
    if (item.image?.count ?? 0) == 0 {
      return Empty<UIImage, Never>().eraseToAnyPublisher()
    }
    
    return URLSession.shared.dataTaskPublisher(for: URL(string: item.image!)!)
      .map { $0.data }
      .tryMap { imageData in
        guard let image = UIImage(data: imageData) else { throw CustomErrors.noData }
        return image
      }
      .catch { _ in Empty<UIImage, Never>()}
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
}

