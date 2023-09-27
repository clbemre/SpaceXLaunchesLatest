//
//  FontBook.swift
//  SpaceXLatestLaunch
//
//  Created by Yunus Emre Celebi on 26.09.2023.
//

import UIKit

protocol Fontable {
    var family: String { get }
    var style: String { get }
    var fontExtension: String { get }
    func of(size: CGFloat) -> UIFont
}

extension Fontable {
    func of(size: CGFloat = 12) -> UIFont {
        return UIFont(name: "\(self.family)-\(self.style)", size: size) ?? UIFont.systemFont(ofSize: size)
    }
}

public struct FontBook {

    // JBMono
    enum JetBrainsMono: String, Fontable {

        var family: String {
            return "JetBrainsMono"
        }

        var style: String {
            return self.rawValue
        }

        var fontExtension: String {
            return "ttf"
        }

        case Light
        case Regular
        case Medium
        case Bold
    }
}

// MARK: UIFont Extension
extension UIFont {

    // MARK: JBMono
    static func fontJetBrainsMonoLight(size: CGFloat = 12) -> UIFont {
        return .fontJetBrainsMono(type: .Light, size: size)
    }

    static func fontJetBrainsMonoRegular(size: CGFloat = 12) -> UIFont {
        return .fontJetBrainsMono(type: .Regular, size: size)
    }

    static func fontJetBrainsMonoMedium(size: CGFloat = 12) -> UIFont {
        return .fontJetBrainsMono(type: .Medium, size: size)
    }

    static func fontJetBrainsMonoBold(size: CGFloat = 12) -> UIFont {
        return .fontJetBrainsMono(type: .Bold, size: size)
    }

    static func fontJetBrainsMono(type: FontBook.JetBrainsMono, size: CGFloat = 12) -> UIFont {
        return type.of(size: size)
    }
}
