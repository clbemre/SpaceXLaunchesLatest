//
//  CGFloat+Extensions.swift
//
//  Created by Yunus Emre Celebi
//

import UIKit

extension CGFloat {

    func adjustWidthRespectToDesignRate() -> CGFloat {
        let designRate = 375 / self
        let value = UIScreen.width / designRate
        return value
    }

    func adjustHeightRespectToDesignRate() -> CGFloat {
        let designRate = 667 / self
        let value = UIScreen.height / designRate
        return value
    } 
}
