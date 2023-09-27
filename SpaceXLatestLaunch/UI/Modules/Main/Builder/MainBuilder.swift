//
//  MainBuilder.swift
//  SpaceXLatestLaunch
//
//  Created by Yunus Emre Celebi on 26.09.2023.
//

import UIKit

enum MainBuilder {

    static func generate(coordinator: IMainCoordinator) -> MainViewController {
        let repository = LaunchesRepository.getInstance()
        let viewModel = MainViewModel(repository: repository)
        return .init(viewModel: viewModel, coordinator: coordinator)
    }
}
