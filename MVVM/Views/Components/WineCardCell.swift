//
//  WineCardCell.swift
//  HW13
//
//  Created by Elena on 18/12/24.
//

import SwiftUI
import Kingfisher

struct WineCardCell: View {
    let title: String
    let subTitle: String
    let image: String
    
    var body: some View {
        HStack {
            KFImage(URL(string: image))
                .resizable()
                .scaledToFit()
                .frame(width: 88, height: 88)
                .padding()
            
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(Color.black)
                Text(subTitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
        )
        .padding(.horizontal)
    }
}
