//
//  FoodDeliveryApp.swift
//  FoodDelivery
//
//  Created by Altynbek Usenbekov on 6/12/20.
//

import SwiftUI

@main
struct FoodDeliveryApp: App {
  
//  let menuDataProvider = SampleMenuDataProvider(immediatelyStub: true) // Local data
  let menuDataProvider = SampleMenuDataProvider()
  
  var body: some Scene {
    WindowGroup {
      ContentView(menuProvider: menuDataProvider)
    }
  }
}
