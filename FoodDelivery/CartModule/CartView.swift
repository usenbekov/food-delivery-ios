//
//  CartView.swift
//  FoodDelivery
//
//  Created by Altynbek Usenbekov on 7/12/20.
//

import SwiftUI

// TODO: use VIPER

struct CartView: View {
  var body: some View {
    VStack(alignment: .leading) {
      HStack { Spacer() }
      
      HStack() {
        Image(uiImage: UIImage(named: "dummy-1")!)
          .resizable()
          .frame(width: 70, height: 70)
          .aspectRatio(contentMode: .fill)
          .clipped()
        
        Text("Pepperoni")
          .padding(2)
        Spacer()
        Text("46 $")
          .padding(2)
      }
      .padding(.vertical, 8)
      
      HStack() {
        Image(uiImage: UIImage(named: "dummy-2")!)
          .resizable()
          .frame(width: 70, height: 70)
          .aspectRatio(contentMode: .fill)
          .clipped()
        
        Text("California")
          .padding(2)
        Spacer()
        Text("46 $")
          .padding(2)
      }
      .padding(.vertical, 8)
      
      Text("").padding(2)
      
      Text("Delivery is free")
        .font(.footnote)
        .foregroundColor(Color.black.opacity(0.25))
      
      HStack(alignment: .lastTextBaseline) {
        Text("Value:")
        Text("160 $")
          .font(.largeTitle)
          .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
          .padding(4)
      }
      
      Spacer()
    }
    .padding(.horizontal, 24)
    .padding(.vertical, 32)
  }
}

struct CartView_Previews: PreviewProvider {
  static var previews: some View {
    CartView()
  }
}
