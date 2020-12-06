//
//  MenuView.swift
//  FoodDelivery
//
//  Created by Altynbek Usenbekov on 6/12/20.
//

import SwiftUI

struct MenuView: View {
  @ObservedObject var presenter: MenuPresenter

  var body: some View {
    List {
      ForEach (presenter.items, id: \.id) { item in
        Text(item.name ?? "")
      }
    }
  }
}

struct MenuView_Previews: PreviewProvider {
  static var previews: some View {
    let dataProvider = SampleMenuDataProvider()
    let interactor = MenuInteractor(dataProvider: dataProvider)
    let presenter = MenuPresenter(interactor: interactor)
    MenuView(presenter: presenter)
  }
}
