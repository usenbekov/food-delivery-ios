//
//  MenuDataProvider.swift
//  FoodDelivery
//
//  Created by Altynbek Usenbekov on 6/12/20.
//

import Foundation
import Combine
import Moya
import ObjectMapper

protocol MenuDataProvider {
  func items() -> AnyPublisher<[MenuItem], Never>
}

class SampleMenuDataProvider: MenuDataProvider {
  private let stubClosure: MoyaProvider<MockAPI>.StubClosure;
  
  init(immediatelyStub: Bool = false) {
    if immediatelyStub {
      self.stubClosure = MoyaProvider.immediatelyStub
    } else {
      self.stubClosure = MoyaProvider.neverStub
    }
  }
  
  func items() -> AnyPublisher<[MenuItem], Never> {
    return Deferred {
      Future { promise in
        MoyaProvider<MockAPI>(stubClosure: self.stubClosure).request(.getMenuItems) { result in
          switch result {
          case let .success(resp):
            let items = Mapper<MenuItem>().mapArray(JSONObject: resp.data.jsonDecode) ?? []
            promise(.success(items))
          case let .failure(error):
            print(error)
            promise(.success([]))
          }
        }
      }
    }.eraseToAnyPublisher()
  }
}

// MARK: - Helpers
private extension Data {
  var jsonDecode: Any? {
    do {
      return try JSONSerialization.jsonObject(with: self, options: [])
    } catch {
      print(error.localizedDescription)
    }
    return nil
  }
}

