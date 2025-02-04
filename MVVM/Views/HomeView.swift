//
//  ContentView.swift
//  HW13
//
//  Created by Elena on 18/12/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Навигационная панель
                HStack {
                    Spacer()
                    NavigationLink(destination: FavoritesView(viewModel: viewModel)) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                            .font(.system(size: 30))
                            .padding(.trailing, 16)
                    }
                }
                .padding(.top, 16)
                
                // Баннер
                AutoBannerSection(
                    titles: viewModel.titles,
                    images: viewModel.images,
                    currentIndex: $viewModel.currentBannerIndex
                )
                .frame(height: 200)
                .onReceive(viewModel.timer) { _ in
                    withAnimation {
                        viewModel.currentBannerIndex = (viewModel.currentBannerIndex + 1) % viewModel.images.count
                    }
                }
                
                // Панель поиска
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
                
                // Список категорий
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(["Все", "Красное", "Белое", "Игристое", "Розовое", "Десертное", "Портвейн"], id: \.self) { category in
                            Button(action: {
                                viewModel.selectedCategory = category
                            }) {
                                Text(category)
                                    .padding()
                                    .frame(width: 130)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(viewModel.selectedCategory == category ? Color(hex: "#D82F75") : Color(hex: "#D82F75").opacity(0.4))
                                            .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 4)
                                    )
                                    .foregroundColor(.white)
                                    .font(.headline)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 16)
                // Список карточек
                ScrollView {
                    LazyVStack(spacing: 24) {
                        ForEach(viewModel.filteredCards) { card in
                            NavigationLink(destination: WineDetailView(card: card, favorites: $viewModel.favorites)) {
                                WineCardCell(card: card)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding()
                }
            }
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.white, Color(hex: "#FDDEF1")]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)
            )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
