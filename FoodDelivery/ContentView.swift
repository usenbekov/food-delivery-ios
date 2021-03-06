//
//  ContentView.swift
//  FoodDelivery
//
//  Created by Altynbek Usenbekov on 6/12/20.
//

import SwiftUI

struct ContentView: View {
  let menuProvider: MenuDataProvider
  let imageProvider: ImageDataProvider
  
  var body: some View {
    NavigationView {
      MenuView(presenter:
      MenuPresenter(interactor:
        MenuInteractor(
          dataProvider: menuProvider,
          imageProvider: imageProvider
        )))
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(
      menuProvider: SampleMenuDataProvider(),
      imageProvider: DummyImageDataProvider()
    )
  }
}
