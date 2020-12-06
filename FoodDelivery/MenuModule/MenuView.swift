//
//  MenuView.swift
//  FoodDelivery
//
//  Created by Altynbek Usenbekov on 6/12/20.
//

import SwiftUI

struct MenuView: View {
  @ObservedObject var presenter: MenuPresenter
  @State var showCartSheet = false

  var body: some View {
    VStack {
      ZStack(alignment: .bottomTrailing) {
        ScrollView {
          ListHeaderView()
          
          ForEach (presenter.items, id: \.id) { item in
            MenuItemCell(item: item, imageProvider: presenter.imageProvider)
          }
        }
        
        // Cart button
        Button(action: {
          showCartSheet.toggle()
        }, label: {
          ZStack() {
            Image(systemName: "cart")
              .font(.body)
              .padding(16)
              .background(Color.white)
              .foregroundColor(.black)
              .cornerRadius(40)
              .padding(32)
              .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 0)
            
            ZStack() {
              Circle().foregroundColor(.green)
              Text("2")
                .foregroundColor(.white)
                .font(Font.system(size: 12))
            }
            .frame(width: 20, height: 20)
            .offset(x: 20, y: -20)
          }
        })
        .sheet(isPresented: $showCartSheet, content: {
          presenter.cartViewBuilder()
        })
      }
      
      Spacer()
    }
  }
}

struct MenuView_Previews: PreviewProvider {
  static var previews: some View {
    let dataProvider = SampleMenuDataProvider(immediatelyStub: true)
    let interactor = MenuInteractor(dataProvider: dataProvider, imageProvider: DummyImageDataProvider())
    let presenter = MenuPresenter(interactor: interactor)
    MenuView(presenter: presenter)
  }
}
