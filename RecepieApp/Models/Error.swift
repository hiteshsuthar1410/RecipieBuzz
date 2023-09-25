//
//  Error.swift
//  RecepieApp
//
//  Created by Hitesh Suthar on 25/09/23.
//

import Foundation
enum URLError: String {
    case invalidURL
}

enum NetworkError: Error {
    case emptyData
}

enum JSONError: Error {
    case conversionFailure
}
