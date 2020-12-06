//
//  ContentView.swift
//  FoodDelivery
//
//  Created by Altynbek Usenbekov on 6/12/20.
//

import SwiftUI

struct ContentView: View {
  let menuProvider: MenuDataProvider
  
  var body: some View {
    NavigationView {
      MenuView(presenter:
      MenuPresenter(interactor:
        MenuInteractor(dataProvider: menuProvider)))
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(menuProvider: SampleMenuDataProvider())
  }
}
