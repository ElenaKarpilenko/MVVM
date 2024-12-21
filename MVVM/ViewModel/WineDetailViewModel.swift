//
//  WineCardViewModel.swift
//  HW13
//
//  Created by Elena on 18/12/24.
//

import SwiftUI
import Combine

class WineDetailViewModel: ObservableObject {
    @Published var isFavorite: Bool
    let card: WineCard
    @Binding var favorites: [WineCard]

    init(card: WineCard, favorites: Binding<[WineCard]>) {
        self.card = card
        self._favorites = favorites
        self.isFavorite = card.isFavorite
    }

    // Градиентные цвета на основе состояния
    var backgroundGradientColors: [Color] {
        isFavorite
            ? [Color.white, Color(hex: "#FDDEF1")] // Розовый градиент при избранном
            : [Color.white, Color(hex: "#D3E0EA")] // Светлый голубой градиент по умолчанию
    }

    // Функция для изменения избранного состояния
    func toggleFavorite() {
        isFavorite.toggle()
        if isFavorite {
            if !favorites.contains(where: { $0.id == card.id }) {
                favorites.append(card)
            }
        } else {
            favorites.removeAll { $0.id == card.id }
        }
    }
    
//        private func toggleFavorite(for card: WineCard) {
//            // Проверяем индекс карточки в массиве wineCards
//            if let index = wineCards.firstIndex(where: { $0.id == card.id }) {
//                wineCards[index].isFavorite.toggle() // Переключаем статус избранного
//    
//    
//            }
//        }
}


