//
//  ANRefreshControl.swift
//
//  Created by Yunus Emre Celebi
//

import UIKit

class ANRefreshControl: BaseReusableRefreshControl {

    private var callbackPullToRefresh: (() -> Void)? = nil
    private var isAutoEndRefreshing: Bool = true

    override func initializeComponent() {
        tintColor = .white
        addTarget(self, action: #selector(self.ActionPullToRefresh(_:)), for: .valueChanged)
    }

    func listenPullToRefresh(isAutoEndRefreshing: Bool = true,
                             callbackPullToRefresh: @escaping (() -> Void)) {
        self.callbackPullToRefresh = callbackPullToRefresh
        self.isAutoEndRefreshing = isAutoEndRefreshing
    }

    @objc func ActionPullToRefresh(_ sender: AnyObject) {
        self.callbackPullToRefresh?()
        if isAutoEndRefreshing {
            self.endRefreshing()
        }
    }
}
