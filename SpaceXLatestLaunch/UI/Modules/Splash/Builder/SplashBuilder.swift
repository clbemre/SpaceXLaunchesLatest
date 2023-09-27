//
//  SplashBuilder.swift
//  SpaceXLatestLaunch
//
//  Created by Yunus Emre Celebi on 26.09.2023.
//

import UIKit

enum SplashBuilder {

    static func generate(coordinator: ISplashCoordinator) -> SplashViewController {
        let viewModel = SplashViewModel()
        return .init(viewModel: viewModel, coordinator: coordinator)
    }

}
