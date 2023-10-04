//
//  RecipieInstruction.swift
//  RecepieApp
//
//  Created by Hitesh Suthar on 04/10/23.
//

import Foundation
struct RecipieInstructionResponse: Codable {
    let recipeInstruction: [RecipieInstruction]?
    
    struct RecipieInstruction: Codable {
        let name: String?
        let steps: [RecipieInstructionStep]?
    }
    struct RecipieInstructionStep: Codable {
        let number: Int?
        let step: String?
    }
}
