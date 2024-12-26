//
//  WineCardViewModel.swift
//  HW13
//
//  Created by Elena on 18/12/24.
//

import SwiftUI
import Combine

class WineDetailViewModel: ObservableObject {
        
//    @Published var isFavorite: Bool
    let wineService = WineService.shared
    let wineID: Int
    var category: String
    @Binding var favorites: [Wine]
    @Published var wine: Wine?
    
    init(wineID: Int, category: String, favorites: Binding<[Wine]>) {
        self.wineID = wineID
        self.category = category
        self._favorites = favorites
        //        self.isFavorite = item.isFavorite
    }
    
    // Градиентные цвета на основе состояния
    var backgroundGradientColors: [Color] {
        //        isFavorite
        //            ? [Color.white, Color(hex: "#FDDEF1")] // Розовый градиент при избранном
        //            :
        [Color.white, Color(hex: "#D3E0EA")] // Светлый голубой градиент по умолчанию
    }
    
    // Функция для изменения избранного состояния
    func toggleFavorite() {
        //        isFavorite.toggle()
        //        if isFavorite {
        //            if !favorites.contains(where: { $0.id == item.id }) {
        //                favorites.append(item)
        //            }
        //        } else {
        //            favorites.removeAll { $0.id == item.id }
        //        }
    }
    
    func getWine(id: Int, type: String) {
        wineService.getWine(for: id, for: type) { result in
            switch result {
            case .success(let wine):
                print(wine)
                DispatchQueue.main.async {
                    print(wine)
                    self.wine = wine
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
                            
                            
