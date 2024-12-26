//
//  WineCard.swift
//  HW13
//
//  Created by Elena on 18/12/24.
//

import Foundation

struct Wine: Codable, Identifiable {
    let id: Int
    let winery: String
    let wine: String
    let location: String
    let image: String
    var rating: Rating
}

struct Rating: Codable {
    let average: String
    let reviews: String
}
