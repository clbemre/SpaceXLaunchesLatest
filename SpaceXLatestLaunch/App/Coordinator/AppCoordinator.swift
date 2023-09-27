//
//  AppCoordinator.swift
//  SpaceXLatestLaunch
//
//  Created by Yunus Emre Celebi on 26.09.2023.
//

import UIKit

protocol AppCoordinatorFlow: AnyObject {

    func startMainFlow()
}

class AppCoordinator: RootableCoordinator, AppCoordinatorFlow {

    override func start() {
        let splashCoordinator = SplashCoordinator(window: self.window)
        coordinate(to: splashCoordinator)
    }

    func startMainFlow() {
        let mainCoordinator = MainCoordinator(window: self.window)
        coordinate(to: mainCoordinator)
    }
}
