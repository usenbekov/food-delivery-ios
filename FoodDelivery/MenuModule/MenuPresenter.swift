//
//  MenuPresenter.swift
//  FoodDelivery
//
//  Created by Altynbek Usenbekov on 6/12/20.
//

import SwiftUI
import Combine

class MenuPresenter: ObservableObject {
  private let interactor: MenuInteractor
  private let router = MenuRouter()
  
  private var cancellables = Set<AnyCancellable>()
  
  @Published var items: [MenuItem] = []
  
  init(interactor: MenuInteractor) {
    self.interactor = interactor
    
    interactor.$items
      .assign(to: \.items, on: self)
      .store(in: &cancellables)
  }
}
