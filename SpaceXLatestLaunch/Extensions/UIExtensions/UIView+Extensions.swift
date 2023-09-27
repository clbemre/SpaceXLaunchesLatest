//
//  UIView+Extensions.swift
//
//  Created by Yunus Emre Celebi
//

import UIKit

extension UIView {

    // ** Loads instance from nib with the same name. */
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        // print(nibName)
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}
