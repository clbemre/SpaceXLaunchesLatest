//
//  UIRefreshControl+Extensions.swift
//
//  Created by Yunus Emre Celebi
//

import UIKit

extension UIRefreshControl {

    func playAnimation(isLoading: Bool, endRefreshDelayMS: Int = 500) {
        if isLoading {
            let offsetPoint = CGPoint.init(x: 0, y: -frame.size.height)
            if let scrollView = superview as? UIScrollView {
                scrollView.setContentOffset(offsetPoint, animated: true)
            }
            self.beginRefreshing()
        } else {
            DispatchQueue.delay(endRefreshDelayMS) { [weak self] in
                self?.endRefreshing()
            }
        }
    }
}
