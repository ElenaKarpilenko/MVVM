//
//  WineDetailView.swift
//  HW13
//
//  Created by Elena on 18/12/24.

import SwiftUI

struct WineDetailView: View {
    @StateObject private var viewModel: WineDetailViewModel // ViewModel

    init(card: WineCard, favorites: Binding<[WineCard]>) {
        _viewModel = StateObject(wrappedValue: WineDetailViewModel(card: card, favorites: favorites))
    }

    var body: some View {
        ZStack {
            // Изначальный градиентный фон
            LinearGradient(
                gradient: Gradient(colors: viewModel.backgroundGradientColors),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            .animation(.easeInOut(duration: 0.5), value: viewModel.isFavorite) // Анимация изменения фона

            VStack(spacing: 16) {
                // Изображение вина
                Image(viewModel.card.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 4)

                // Название и описание
                VStack(spacing: 8) {
                    Text(viewModel.card.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)

                    Text(viewModel.card.description)
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 16)
                }

                // Рейтинг и кнопка избранного
                HStack {
                    // Рейтинг
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("4.9") // Рейтинг
                            .font(.headline)
                    }

                    Spacer()

                    // Кнопка "Избранное"
                    Button(action: {
                        viewModel.toggleFavorite()
                    }) {
                        Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(.red)
                            .font(.title)
                            .animation(.easeInOut, value: viewModel.isFavorite)
                    }
                }
                .padding(.horizontal, 24)

                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
