//
//  SplashCoordinator.swift
//  SpaceXLatestLaunch
//
//  Created by Yunus Emre Celebi on 26.09.2023.
//

import UIKit

protocol ISplashCoordinator: AnyObject {
    func startMainFlow()
}

final class SplashCoordinator: RootableCoordinator, ISplashCoordinator {

    private lazy var splashController: SplashViewController = {
        return SplashBuilder.generate(coordinator: self)
    }()

    override func start() {
        // let controller = SplashBuilder.generate(coordinator: self)
        window?.rootViewController = splashController
        window?.makeKeyAndVisible()
    }

    func startMainFlow() {
        // let mainCoordinator = MainCoordinator(window: self.window)
        // mainCoordinator.startWithAnimation()

        // OR

        self.splashController.appDelegate?.startFlowMain()
    }
}

