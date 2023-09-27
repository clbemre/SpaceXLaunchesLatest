//
//  UINavigationController+Extensions.swift
//
//  Created by Yunus Emre Celebi
//

import UIKit

extension UINavigationController {

    var lastViewController: UIViewController? {
        return viewControllers.last
    }
}
