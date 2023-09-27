//
//  UIViewController+Extensions.swift
//
//  Created by Yunus Emre Celebi
//

import UIKit

extension UIViewController {

    var appDelegate: AppDelegate? {
        get {
            return UIApplication.shared.delegate as? AppDelegate
        }
    }

    func presentViewController(_ viewControllerToPresent: UIViewController, animated: Bool = true) {
        self.present(viewControllerToPresent, animated: animated, completion: nil)
    }
}
