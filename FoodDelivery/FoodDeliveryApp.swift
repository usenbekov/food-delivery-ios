//
//  FoodDeliveryApp.swift
//  FoodDelivery
//
//  Created by Altynbek Usenbekov on 6/12/20.
//

import SwiftUI

@main
struct FoodDeliveryApp: App {
  let menuProvider = SampleMenuDataProvider(immediatelyStub: true) // Local data
//  let menuProvider = SampleMenuDataProvider()
  
  let imageProvider = DummyImageDataProvider()
//  let imageProvider = URLImageDataProvider()
  
  var body: some Scene {
    WindowGroup {
      ContentView(
        menuProvider: menuProvider,
        imageProvider: imageProvider
      )
    }
  }
}
