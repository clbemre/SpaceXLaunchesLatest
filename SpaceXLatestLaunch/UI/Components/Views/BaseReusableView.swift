//
//  BaseReusableView.swift
//
//  Created by Yunus Emre Celebi
//

import UIKit

open class BaseReusableView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeComponent()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeComponent()
    }

    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initializeComponent()
    }

    internal func initializeComponent() {
        preconditionFailure("initializeComponent - This method must be overridden")
    }
}
