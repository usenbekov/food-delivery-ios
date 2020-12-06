//
//  MenuInteractor.swift
//  FoodDelivery
//
//  Created by Altynbek Usenbekov on 6/12/20.
//

import Foundation
import Combine

class MenuInteractor {
  private let dataProvider: MenuDataProvider
  let imageProvider: ImageDataProvider
  
  private var cancellables = Set<AnyCancellable>()
  
  @Published var items: [MenuItem] = []
  
  init (dataProvider: MenuDataProvider, imageProvider: ImageDataProvider = URLImageDataProvider()) {
    self.dataProvider = dataProvider
    self.imageProvider = imageProvider
    
    self.dataProvider.items()
      .assign(to: \.items, on: self)
      .store(in: &cancellables)
  }
  
}
