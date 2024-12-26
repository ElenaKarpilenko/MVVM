//
//  ViewModel.swift
//  HW13
//
//  Created by Elena on 18/12/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    private let wineService = WineService.shared
    
    @Published var wineTypes: [String] = ["Красное", "Белое", "Мигреро", "Розовое", "Десерт", "Норесдан"]
    @Published var showBookCover = true
    @Published var selectedCategory: String = "Красное" {
        didSet {
            fetchWines(category: selectedCategory)
        }
    }
    @Published var favorites: [Wine] = []
    @Published var currentBannerIndex: Int = 0
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    @Published var wines: [Wine] = []
    
    var filteredFavorites: [Wine] {
        if searchText.isEmpty {
            return favorites
        } else {
            return favorites.filter { $0.wine.lowercased().contains(searchText.lowercased()) }
        }
    }

    // Предустановленные изображения и названия для баннера
    let images = ["vine34", "vino10", "vino36", "vino22", "vino17", "vino23"]
    let titles = ["Игристые вина", "Десертные вина", "Портвейн", "Белое вино", "Красное вино", "Сухие вина"]
    
    func removeFromFavorites(card: Wine) {
        if let index = favorites.firstIndex(where: { $0.id == card.id }) {
            favorites.remove(at: index)
        }
    }

    // Фильтрованные карточки
    var filteredCards: [Wine] {
        wines.filter { card in
            (searchText.isEmpty || card.wine.lowercased().contains(searchText.lowercased()))
        }
    }
    
    // Таймер для автоматической смены баннера
    let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    
    func fetchWines(category: String) {
        wineService.fetchWines(for: category) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.wines = data
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

