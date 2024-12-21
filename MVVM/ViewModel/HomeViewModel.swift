//
//  ViewModel.swift
//  HW13
//
//  Created by Elena on 18/12/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    // Логика и состояния
    @Published var showBookCover = true
    @Published var selectedCategory: String = "Все" // Категория по умолчанию
    @Published var favorites: [WineCard] = []
    @Published var currentBannerIndex: Int = 0
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    @Published var wineCards: [WineCard] = [
        WineCard(imageName: "img_5", title: "Красное Вино 1", description: "Это насыщенное и глубокое вино с богатым ароматом ягод и специй. Отличается мягким вкусом с легкими танинами, идеально сочетается с мясными блюдами.", category: "Красное"),
        WineCard(imageName: "vino", title: "Красное Вино 2", description: "Вино с интенсивным рубиновым цветом и ароматами вишни и черного перца. Вкус полнотелый с хорошо сбалансированной кислотностью, подходящее к пасте и пицце.", category: "Красное"),
        WineCard(imageName: "vino5", title: "Красное Вино 3", description: " Слегка пряное вино с ароматами черной смородины и дуба. Идеально сочетается с жареным мясом или сырами с интенсивным вкусом.", category: "Красное"),
        WineCard(imageName: "vino6", title: "Красное Вино 4", description: "vino11", category: "Красное"),
        // Красное
        WineCard(imageName: "vino11", title: "Красное Вино 1", description: "Этот сорт вина отличается мягкими танинами и ароматом темных ягод с легким послевкусием ванили. Прекрасно подходит к тушеному мясу.", category: "Красное"),
        WineCard(imageName: "image", title: "Красное Вино 2", description: "Этот сорт вина отличается мягкими танинами и ароматом темных ягод с легким послевкусием ванили. Прекрасно подходит к тушеному мясу.", category: "Красное"),
        WineCard(imageName: "img_3", title: "Красное Вино 3", description: "Этот сорт вина отличается мягкими танинами и ароматом темных ягод с легким послевкусием ванили. Прекрасно подходит к тушеному мясу.", category: "Красное"),
        WineCard(imageName: "img_4", title: "Красное Вино 4", description: "Этот сорт вина отличается мягкими танинами и ароматом темных ягод с легким послевкусием ванили. Прекрасно подходит к тушеному мясу.", category: "Красное"),
        WineCard(imageName: "img_5", title: "Красное Вино 5", description: "Описание 5", category: "Красное"),
        WineCard(imageName: "img_6", title: "Красное Вино 6", description: "Описание 6", category: "Красное"),
        WineCard(imageName: "img_7", title: "Красное Вино 7", description: "Описание 7", category: "Красное"),
        WineCard(imageName: "img_8", title: "Красное Вино 8", description: "Описание 8", category: "Красное"),
        WineCard(imageName: "img_9", title: "Красное Вино 9", description: "Описание 9", category: "Красное"),
        WineCard(imageName: "img_10", title: "Красное Вино 10", description: "Описание 10", category: "Красное"),
        WineCard(imageName: "img_11", title: "Красное Вино 11", description: "Описание 11", category: "Красное"),
        WineCard(imageName: "img_12", title: "Красное Вино 12", description: "Описание 12", category: "Красное"),
        WineCard(imageName: "img_13", title: "Красное Вино 13", description: "Описание 13", category: "Красное"),
        WineCard(imageName: "img_14", title: "Красное Вино 14", description: "Описание 14", category: "Красное"),
        WineCard(imageName: "img_15", title: "Красное Вино 15", description: "Описание 15", category: "Красное"),
        WineCard(imageName: "img_16", title: "Красное Вино 16", description: "Описание 16", category: "Красное"),
        WineCard(imageName: "img_17", title: "Красное Вино 17", description: "Описание 17", category: "Красное"),
        WineCard(imageName: "img_18", title: "Красное Вино 18", description: "Описание 18", category: "Красное"),
        WineCard(imageName: "img_19", title: "Красное Вино 19", description: "Описание 19", category: "Красное"),
        WineCard(imageName: "img_20", title: "Красное Вино 20", description: "Описание 20", category: "Красное"),
        WineCard(imageName: "vino11", title: "Розовое Вино 1", description: " подходит к тушеному мясу.", category: "Розовое"),
        WineCard(imageName: "image", title: "Розовое Вино 2", description: "Этот сорт вина отличается мягкими танинами и ароматом темных ягод с легким послевкусием ванили. Прекрасно подходит к тушеному мясу.", category: "Розовое"),
        WineCard(imageName: "img_3", title: "Розовое Вино 3", description: "Этот сорт вина отличается мягкими танинами и ароматом темных ягод с легким послевкусием ванили. Прекрасно подходит к тушеному мясу.", category: "Розовое"),
        WineCard(imageName: "img_4", title: "Розовое Вино 4", description: "Этот сорт вина отличается мягкими танинами и ароматом темных ягод с легким послевкусием ванили. Прекрасно подходит к тушеному мясу.", category: "Розовое"),
        WineCard(imageName: "img_5", title: "Розовое Вино 5", description: "Описание 5", category: "Розовое"),
        WineCard(imageName: "img_6", title: "Розовое Вино 6", description: "Описание 6", category: "Розовое"),
        WineCard(imageName: "img_7", title: "Розовое Вино 7", description: "Описание 7", category: "Розовое"),
        WineCard(imageName: "img_8", title: "Розовое Вино 8", description: "Описание 8", category: "Розовое"),
        WineCard(imageName: "img_9", title: "Розоаое Вино 9", description: "Описание 9", category: "Розовое"),
        WineCard(imageName: "img_10", title: "Розовое Вино 10", description: "Описание 10", category: "Розовое"),
        WineCard(imageName: "img_11", title: "Розовое Вино 11", description: "Описание 11", category: "Розовое"),
        WineCard(imageName: "img_12", title: "Розовое Вино 12", description: "Описание 12", category: "Розовое"),
        WineCard(imageName: "img_13", title: "Розовое Вино 13", description: "Описание 13", category: "Розовое"),
        WineCard(imageName: "img_14", title: "Красное Вино 14", description: "Описание 14", category: "Красное"),
        WineCard(imageName: "img_15", title: "Красное Вино 15", description: "Описание 15", category: "Красное"),
        WineCard(imageName: "img_16", title: "Красное Вино 16", description: "Описание 16", category: "Красное"),
        WineCard(imageName: "img_17", title: "Красное Вино 17", description: "Описание 17", category: "Красное"),
        WineCard(imageName: "img_18", title: "Красное Вино 18", description: "Описание 18", category: "Красное"),
        WineCard(imageName: "img_19", title: "Красное Вино 19", description: "Описание 19", category: "Красное"),
        WineCard(imageName: "img_20", title: "Красное Вино 20", description: "Описание 20", category: "Красное"),
        
        
        // Белое
        WineCard(imageName: "vino11", title: "Белое Вино 1", description: "Легкое и свежее вино с ароматами цитрусовых и зелени. Прекрасно подходит к морепродуктам и свежим салатам.", category: "Белое"),
        WineCard(imageName: "vino", title: "Белое Вино 2", description: "Вино с нотами яблок и груши, с освежающей кислотностью. Отлично сочетается с куриным филе и пастой с соусом на основе сливок.", category: "Белое"),
        WineCard(imageName: "vino5", title: "Белое Вино 3", description: "Вино с выраженными ароматами тропических фруктов и легким цветочным оттенком. Идеально сочетается с рыбой и морепродуктами.", category: "Белое"),
        WineCard(imageName: "vino6", title: "Белое Вино 4", description: "Чистый и яркий вкус с нотами персика и цитрусовых. Отличное дополнение к блюдам из креветок или легким овощным салатам.", category: "Белое"),
        // (добавьте аналогично еще 16 карточек для белого вина)
        WineCard(imageName: "vino9", title: "Белое Вино 1", description: "Легкое и свежее вино с ароматами цитрусовых и зелени. Прекрасно подходит к морепродуктам и свежим салатам.", category: "Белое"),
        WineCard(imageName: "vino", title: "Белое Вино 2", description: "Вино с нотами яблок и груши, с освежающей кислотностью. Отлично сочетается с куриным филе и пастой с соусом на основе сливок.", category: "Белое"),
        WineCard(imageName: "vino5", title: "Белое Вино 3", description: "Вино с выраженными ароматами тропических фруктов и легким цветочным оттенком. Идеально сочетается с рыбой и морепродуктами.", category: "Белое"),
        WineCard(imageName: "vino6", title: "Белое Вино 4", description: "Чистый и яркий вкус с нотами персика и цитрусовых. Отличное дополнение к блюдам из креветок или легким овощным салатам.", category: "Белое"),
        // (добавьте аналогично еще 16 карточек для белого вина)
        
        // Игристое
        WineCard(imageName: "vino95", title: "Игристое Вино 1", description: " Легкое игристое вино с яркими пузырьками и ароматом белых цветов и цитрусов. Идеально для праздников и аперитивов.", category: "Игристое"),
        WineCard(imageName: "vino25", title: "Игристое Вино 2", description: "Слегка сладковатое игристое вино с нотами меда и фруктов. Отлично подходит к десертам или фруктовым салатам.", category: "Игристое"),
        WineCard(imageName: "vino5", title: "Игристое Вино 3", description: "Сухое игристое вино с приятной кислинкой и вкусом зеленого яблока. Прекрасно сочетается с сырами и морепродуктами.", category: "Игристое"),
        WineCard(imageName: "vino6", title: "Игристое Вино 4", description: "Вино с интенсивным ароматом цитрусовых и легкими нотами миндаля. Идеальный выбор для закусок и легких блюд.", category: "Игристое"),
        WineCard(imageName: "vino11", title: "Игристое Вино 1", description: " Легкое игристое вино с яркими пузырьками и ароматом белых цветов и цитрусов. Идеально для праздников и аперитивов.", category: "Игристое"),
        WineCard(imageName: "vino", title: "Игристое Вино 2", description: "Слегка сладковатое игристое вино с нотами меда и фруктов. Отлично подходит к десертам или фруктовым салатам.", category: "Игристое"),
        WineCard(imageName: "vino9", title: "Игристое Вино 3", description: "Сухое игристое вино с приятной кислинкой и вкусом зеленого яблока. Прекрасно сочетается с сырами и морепродуктами.", category: "Игристое"),
        WineCard(imageName: "vino6", title: "Игристое Вино 4", description: "Вино с интенсивным ароматом цитрусовых и легкими нотами миндаля. Идеальный выбор для закусок и легких блюд.", category: "Игристое"),
        WineCard(imageName: "vino11", title: "Портвейн 1", description: " Легкое игристое вино с яркими пузырьками и ароматом белых цветов и цитрусов. Идеально для праздников и аперитивов.", category: "Портвейн"),
        WineCard(imageName: "vino25", title: "Портвейн 2", description: "Слегка сладковатое игристое вино с нотами меда и фруктов. Отлично подходит к десертам или фруктовым салатам.", category: "Портвейн"),
        WineCard(imageName: "vino5", title: "Портвейн 3", description: "Сухое игристое вино с приятной кислинкой и вкусом зеленого яблока. Прекрасно сочетается с сырами и морепродуктами.", category: "Портвейн"),
        WineCard(imageName: "vino6", title: "Портвейн 4", description: "Вино с интенсивным ароматом цитрусовых и легкими нотами миндаля. Идеальный выбор для закусок и легких блюд.", category: "Потвейн"),
        WineCard(imageName: "vino11", title: "Десертное 1", description: " Легкое игристое вино с яркими пузырьками и ароматом белых цветов и цитрусов. Идеально для праздников и аперитивов.", category: "Десертное"),
        WineCard(imageName: "vino25", title: "Десертное 2", description: "Слегка сладковатое игристое вино с нотами меда и фруктов. Отлично подходит к десертам или фруктовым салатам.", category: "Десертное"),
        WineCard(imageName: "vino5", title: "Десертное 3", description: "Сухое игристое вино с приятной кислинкой и вкусом зеленого яблока. Прекрасно сочетается с сырами и морепродуктами.", category: "Десертное"),
        WineCard(imageName: "vino9", title: "Игристое Вино 4", description: "Вино с интенсивным ароматом цитрусовых и легкими нотами миндаля. Идеальный выбор для закусок и легких блюд.", category: "Игристое"),
        
    ]
    
    var filteredFavorites: [WineCard] {
        if searchText.isEmpty {
            return favorites
        } else {
            return favorites.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }

    func removeFromFavorites(card: WineCard) {
        if let index = favorites.firstIndex(where: { $0.id == card.id }) {
            favorites.remove(at: index)
        }
    }
    
    // Предустановленные изображения и названия для баннера
    let images = ["vine34", "vino10", "vino36", "vino22", "vino17", "vino23"]
    let titles = ["Игристые вина", "Десертные вина", "Портвейн", "Белое вино", "Красное вино", "Сухие вина"]

    // Фильтрованные карточки
    var filteredCards: [WineCard] {
        wineCards.filter { card in
            (searchText.isEmpty || card.title.lowercased().contains(searchText.lowercased())) &&
            (selectedCategory == "Все" || card.category == selectedCategory)
        }
    }
    
    // Таймер для автоматической смены баннера
    let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    
    // Загрузка данных (симуляция)
    func loadData() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.wineCards = [
                // Замените на реальные данные
            ]
            self.isLoading = false
        }
    }
}

