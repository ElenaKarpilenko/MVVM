//
//  AutoBannerSection.swift
//  HW13
//
//  Created by Elena on 18/12/24.
//

import SwiftUI

struct AutoBannerSection: View {
    let titles: [String]
    
    let images: [String]
    
    @Binding var currentIndex: Int
    
    var body: some View {
        VStack {
            Image(images[currentIndex])
                .resizable()
                .scaledToFit()
                .frame(height: 170)
                .cornerRadius(10)
                .padding(.horizontal)
            
            Text(titles[currentIndex])
                .font(.headline)
                .padding(.top, 8)
            
        }
    }
    
}

