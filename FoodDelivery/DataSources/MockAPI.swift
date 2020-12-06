//
//  MockAPI.swift
//  FoodDelivery
//
//  Created by Altynbek Usenbekov on 6/12/20.
//

import Foundation
import Moya

enum MockAPI {
  case getMenuItems
}

extension MockAPI: TargetType {
  
  var baseURL: URL { return URL(string: "https://5fcc90aa603c0c0016486f1a.mockapi.io/api")! }
  
  var path: String {
    switch self {
    case .getMenuItems:
      return "/menuitems"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .getMenuItems:
      return .get
    }
  }
  
  var task: Task {
    switch self {
    case .getMenuItems: // Send no parameters
      return .requestPlain
    }
  }
  
  var headers: [String: String]? {
    return ["Content-type": "application/json"]
  }
  
  var sampleData: Data {
    switch self {
    case .getMenuItems:
      let jsonStr = [
        MenuItem(JSON: ["id": "1", "name": "Pepperoni", "price": 55, "detail": "Mozarella, Peperoni, Tomatoes, BBQ sauce"])!,
        MenuItem(JSON: ["id": "2", "name": "Deluxe", "price": 46, "detail": "Chicken, Peperoni, Tomatoes, Tomato sauce, spicy chorize"])!
      ].toJSONString()
      return jsonStr!.utf8Encoded
    }
  }
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

