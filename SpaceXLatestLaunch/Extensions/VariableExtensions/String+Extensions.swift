//
//  String+Extensions.swift
//
//  Created by Yunus Emre Celebi
//

import Foundation

// MARK: Convert Props
extension String {

    func upperCasedTR() -> String {
        return self.uppercased(with: Locale.TR)
    }

    func lowerCasedTR() -> String {
        return self.lowercased(with: Locale.TR)
    }

    func capitalizedTR() -> String {
        return self.capitalized(with: Locale.TR)
    }

}
