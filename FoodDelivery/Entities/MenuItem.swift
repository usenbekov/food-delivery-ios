//
//  MenuItem.swift
//  FoodDelivery
//
//  Created by Altynbek Usenbekov on 6/12/20.
//

import Foundation
import ObjectMapper

class MenuItem: Mappable {
  var id: String?
  var name: String?
  var detail: String?
  var price: Double?
  var image: String?
  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    id       <- map["id"]
    name     <- map["name"]
    detail   <- map["detail"]
    price    <- map["price"]
    image    <- map["image"]
  }
}
