//
//  SnapKit+Extensions.swift
//
//  Created by Yunus Emre Celebi
//

import UIKit
import SnapKit

extension ConstraintMaker {

    @discardableResult
    func topSafeArea(view: UIView) -> ConstraintMakerEditable {
        return top.equalTo(view.safeAreaLayoutGuide.snp.top)
    }

    @discardableResult
    func bottomSafeaArea(view: UIView) -> ConstraintMakerEditable {
        return bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
    }
}

