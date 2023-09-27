//
//  LaunchesRepository.swift
//  SpaceXLatestLaunch
//
//  Created by Yunus Emre Celebi on 26.09.2023.
//

import Foundation
import Moya

protocol ILaunchesRepository {

    func launchesLatest(
        callback: @escaping APIResponseCallback<LaunchesLatestResponse>
    )
}

class LaunchesRepository: BaseRepository<LaunchesService>, ILaunchesRepository {

    func launchesLatest(callback: @escaping APIResponseCallback<LaunchesLatestResponse>) {
        mRequest(.latest_launches, callback: callback)
    }
}

extension LaunchesRepository {
    
    static func getInstance() -> LaunchesRepository {
        return LaunchesRepository(provider: createMoyaProvider(targetType: LaunchesService.self))
    }
}
