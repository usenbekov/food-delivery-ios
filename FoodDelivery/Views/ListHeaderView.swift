//
//  ListHeaderView.swift
//  FoodDelivery
//
//  Created by Altynbek Usenbekov on 7/12/20.
//

import SwiftUI

// TODO: data from provider

struct ListHeaderView: View {
  
  private func getScrollOffset(_ geometry: GeometryProxy) -> CGFloat {
    geometry.frame(in: .global).minY
  }
  
  private func getOffsetForHeader(_ geometry: GeometryProxy) -> CGFloat {
    let offset = getScrollOffset(geometry)
    if offset > 0 { // pulled down
      return -offset
    }
    return 0
  }
  
  private func getHeightForHeader(_ geometry: GeometryProxy) -> CGFloat {
    let offset = getScrollOffset(geometry)
    let h = geometry.size.height
    if offset > 0 {
      return h + offset
    }
    return h
  }
  
  private func getOffsetForImage(_ geometry: GeometryProxy) -> CGFloat {
    let offset = getScrollOffset(geometry)
    if offset < 0 {
      return -offset/2
    }
    return 0
  }
  
  private func getOpacityForImage(_ geometry: GeometryProxy) -> Double {
    let offset = getScrollOffset(geometry)
    print(offset)
    if offset < -260.0 {
      let val = -260.0/(Double(offset))
      return pow(val, 2)
    }
    return 1
  }
  
  var body: some View {
    GeometryReader { geometry in
      ZStack() {
        TabView {
          Image(uiImage: UIImage(named: "dummy-0")!)
            .resizable()
            .scaledToFill()
            .frame(width: geometry.size.width, height: self.getHeightForHeader(geometry))
            .offset(x: 0, y: self.getOffsetForImage(geometry))
            .clipped()
          
          Image(uiImage: UIImage(named: "dummy-1")!)
            .resizable()
            .scaledToFill()
            .frame(width: geometry.size.width, height: self.getHeightForHeader(geometry))
            .offset(x: 0, y: self.getOffsetForImage(geometry))
            .clipped()
          
          Image(uiImage: UIImage(named: "dummy-2")!)
            .resizable()
            .scaledToFill()
            .frame(width: geometry.size.width, height: self.getHeightForHeader(geometry))
            .offset(x: 0, y: self.getOffsetForImage(geometry))
            .clipped()
        }
        .tabViewStyle(PageTabViewStyle())
//        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .opacity(self.getOpacityForImage(geometry))
        .frame(width: geometry.size.width, height: self.getHeightForHeader(geometry))
        
        VStack(alignment: .trailing) {
          Spacer()
          HStack() {
            Spacer()
          }
          .frame(height: 60)
          .background(Color.white)
          .cornerRadius(40)
          .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 0)
          .offset(y: 30)
        }
      }
      .clipped()
      .offset(x: 0, y: self.getOffsetForHeader(geometry))
    }
    .frame(height: 460)
    .padding(.bottom, 16)
  }
}

struct ListHeaderView_Previews: PreviewProvider {
  static var previews: some View {
    ListHeaderView()
  }
}
