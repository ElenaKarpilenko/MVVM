//
//  WineDetailView.swift
//  HW13
//
//  Created by Elena on 18/12/24.

import SwiftUI
import Kingfisher

struct WineDetailView: View {
    @StateObject var viewModel: WineDetailViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: viewModel.backgroundGradientColors),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            //            .animation(.easeInOut(duration: 0.5), value: viewModel.isFavorite) // Анимация изменения фона
            
            VStack(spacing: 16) {
                // Изображение вина
                KFImage(URL(string: viewModel.wine?.image ?? ""))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 300)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 4)
                
                // Название и описание
                VStack(spacing: 8) {
                    Text(viewModel.wine?.wine ?? "")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text(viewModel.wine?.winery ?? "")
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 16)
                    
                    Text(viewModel.wine?.location ?? "")
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 16)
                }
                
                // Рейтинг и кнопка избранного
                HStack {
                    Text(viewModel.wine?.rating.reviews ?? "")
                            .font(.headline)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(viewModel.wine?.rating.average ?? "")
                            .font(.headline)
                    
                    Spacer()
                    
                    // Кнопка "Избранное"
                    Button(action: {
                        viewModel.toggleFavorite()
                    }) {
                        //                        Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                        //                            .foregroundColor(.red)
                        //                            .font(.title)
                        //                            .animation(.easeInOut, value: viewModel.isFavorite)
                    }
                }
                .padding(.horizontal, 24)
                
                Spacer()
            }
        }
        .onAppear {
            viewModel.getWine(id: viewModel.wineID, type: viewModel.category)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
