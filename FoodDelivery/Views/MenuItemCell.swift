//
//  MenuItemCell.swift
//  FoodDelivery
//
//  Created by Altynbek Usenbekov on 6/12/20.
//

import SwiftUI
import Combine

struct MenuItemCell: View {
  let item: MenuItem
  let imageProvider: ImageDataProvider
  
  @State private var image: UIImage = UIImage()
  @State private var cancellable: AnyCancellable?

  var body: some View {
    LazyVStack(alignment: .leading) {
      Image(uiImage: self.image)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .clipped()
      
      VStack(alignment: .leading) {
        Text(item.name ?? "")
          .font(.system(size: 20))
          .fontWeight(.bold)
          .foregroundColor(.primary)
        
        Text(item.detail ?? "")
          .font(.footnote)
          .foregroundColor(.secondary)
          .padding(.vertical, 1)
        
        VStack(alignment: .trailing) {
          HStack {
            Spacer()
          }
          
          Button(action: {
            
          }, label: {
            Text("\(String(format: "%.2f", item.price ?? 0)) $")
              .font(.footnote)
              .padding(10)
              .padding(.horizontal, 16)
              .background(Color.black)
              .cornerRadius(40)
              .foregroundColor(.white)
              
          })
        }
      }
      .padding(.vertical, 10)
      .padding(.bottom, 14)
      .padding(.horizontal, 24)
    }
    .background(Color.white)
    .cornerRadius(16)
    .shadow(color: Color.black.opacity(0.07), radius: 4, x: 0, y: 0)
    .padding(.vertical, 8)
    .padding(.horizontal, 40)
    .clipped()
    .onAppear() {
      self.cancellable = self.imageProvider
        .image(for: self.item)
        .assign(to: \.image, on: self)
    }
  }
}

struct MenuItemCell_Previews: PreviewProvider {
  static var previews: some View {
    let item = MenuItem(JSON: ["id": "1", "name": "Pepperoni", "price": 55.0, "detail": "Mozarella, Peperoni, Tomatoes, BBQ sauce"])!
    let imageProvider = DummyImageDataProvider()
    
    MenuItemCell(
      item: item,
      imageProvider: imageProvider
    ).frame(height: 320, alignment: .center)
  }
}
