//
//  Error.swift
//  RecepieApp
//
//  Created by Hitesh Suthar on 25/09/23.
//

import Foundation
enum URLError: Error {
    case invalidURL
}

enum NetworkError: Error {
    case emptyData
}

enum JSONError: Error {
    case conversionFailure
}

enum PropertyError: String, Error {
    case emptyProperty = "Found nil in the property"
}

enum CastingError: String, Error {
    case viewControllerCasting = "View Controller casting failed"
    case itemORCellCasting = "Cell/Item casting failed"
}
