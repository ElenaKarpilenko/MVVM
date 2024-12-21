//
//  WineCard.swift
//  HW13
//
//  Created by Elena on 18/12/24.
//

import Foundation

struct WineCard: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
    let category: String
    var isFavorite: Bool = false
}
