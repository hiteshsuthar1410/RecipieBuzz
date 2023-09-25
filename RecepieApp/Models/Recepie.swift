//
//  Recepie.swift
//  RecepieApp
//
//  Created by Hitesh Suthar on 25/09/23.
//

import Foundation

struct Recipices: Codable {
    let recipes: [Recipe]
}
struct Recipe: Identifiable, Codable {
    let id: Int
    let title: String?
    let image: String?
    let serving: Int?
    let readyInMinutes: Int?
    let pricePerServing: Float?
    let dairyFree: Bool?
}
