//
//  UIColor+Extensions.swift
//
//  Created by Yunus Emre Celebi
//

import UIKit

extension UIColor {

    // MARK: General Colors
    static var an_black: UIColor { .black }
    static var an_white: UIColor { .white }
    static var an_orange: UIColor { .orange }
    static var an_blue: UIColor { .blue }
    static var an_green: UIColor { .green }
    static var an_red: UIColor { .red }
    static var an_clear: UIColor { .clear }
    static var an_brown: UIColor { .brown }
    static var an_gray: UIColor { .gray }
    static var an_lightGray: UIColor { .lightGray }
    static var an_darkGray: UIColor { .darkGray }
    static var an_cyan: UIColor { .cyan }
    static var an_purple: UIColor { .purple }

    static var spaceXBrandColor: UIColor { .init(named: "SpaceXBrandColor") ?? .clear }

}

// MARK: Adjusting
extension UIColor {

    func lighter(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: abs(percentage))
    }

    func darker(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage))
    }

    func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage / 100, 1.0),
                           green: min(green + percentage / 100, 1.0),
                           blue: min(blue + percentage / 100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
}
