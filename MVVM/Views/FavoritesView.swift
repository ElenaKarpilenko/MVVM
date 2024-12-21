//
//  FavoritesView.swift
//  HW13
//
//  Created by Elena on 18/12/24.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        VStack {
            Text("Избранные вина")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            // Поисковая строка
            TextField("Поиск", text: $viewModel.searchText)
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .overlay(
                    HStack {
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.trailing, 10)
                    }
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(.horizontal)

            // Проверяем, есть ли данные
            if viewModel.filteredFavorites.isEmpty {
                Text("Нет избранных товаров.")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.filteredFavorites) { card in
                            WineCardCell(card: card)
                                .swipeActions {
                                    Button(role: .destructive) {
                                        viewModel.removeFromFavorites(card: card)
                                    } label: {
                                        Label("Удалить", systemImage: "trash")
                                    }
                                }
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Избранное")
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.white, Color(hex: "#FDDEF1")]),
                           startPoint: .top,
                           endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        )
    }
}
