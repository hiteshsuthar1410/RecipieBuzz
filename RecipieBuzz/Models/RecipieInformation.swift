//
//  RecipieInformation.swift
//  RecipieBuzz
//
//  Created by Hitesh Suthar on 26/09/23.
//

import Foundation
struct RecipieInformation: Decodable {
    let id: Int
    let title: String?
    let image: String?
    let serving: Int?
    let readyInMinutes: Int?
    let pricePerServing: Float?
    let dairyFree: Bool?
    let dishTypes: [String]?
    
    let extendedIngredients: [ExtendedIngredient]?
    
    let summary: String?
}

struct ExtendedIngredient: Codable {
    let id: Int
    let original: String?
}
