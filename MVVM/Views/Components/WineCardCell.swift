//
//  WineCardCell.swift
//  HW13
//
//  Created by Elena on 18/12/24.
//

import SwiftUI

struct WineCardCell: View {
    let card: WineCard

    var body: some View {
        HStack {
            Image(card.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 100)
                .cornerRadius(12) // Закругленные углы
                .shadow(color: .black.opacity(0.3), radius: 6, x: 0, y: 4) // Тень для объема

            VStack(alignment: .leading, spacing: 8) {
                Text(card.title)
                    .font(.headline)
                    .foregroundColor(Color.black)
                Text(card.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5) // Тень для фона
        )
        .padding(.horizontal) // Дополнительное расстояние по краям
    }
}
