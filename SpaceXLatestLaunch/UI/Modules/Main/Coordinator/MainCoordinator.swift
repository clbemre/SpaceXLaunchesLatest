//
//  MainCoordinator.swift
//  SpaceXLatestLaunch
//
//  Created by Yunus Emre Celebi on 26.09.2023.
//

import UIKit

protocol IMainCoordinator: AnyObject {

    func startWithAnimation()

}

final class MainCoordinator: RootableCoordinator, IMainCoordinator {

    private lazy var mainController: MainViewController = {
        return MainBuilder.generate(coordinator: self)
    }()

    override func start() {
        window?.rootViewController = mainController
        window?.makeKeyAndVisible()
    }

    func startWithAnimation() {
        window?.switchRootViewController(to: self.mainController)
    }
}


