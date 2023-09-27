//
//  Extensions.swift
//  RecepieApp
//
//  Created by Hitesh Suthar on 27/09/23.
//

import Foundation
extension String {
    func htmlToString() -> String? {
            guard let data = data(using: .utf8) else { return nil }
            do {
                let attributedString = try NSAttributedString(
                    data: data,
                    options: [.documentType: NSAttributedString.DocumentType.html],
                    documentAttributes: nil
                )
                return attributedString.string
            } catch {
                print("Error converting HTML to String: \(error)")
                return nil
            }
        }
}
