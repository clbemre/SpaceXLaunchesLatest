//
//  LaunchesService.swift
//  SpaceXLatestLaunch
//
//  Created by Yunus Emre Celebi on 26.09.2023.
//

import Foundation

enum LaunchesService {
    case latest_launches
}

extension LaunchesService: MTargetType {

    var path: String {
        switch self {
        case .latest_launches:
            return generateEndPoint(lastPath: "launches/latest")
        }
    }
    
    var endPointVersion: String {
        switch self {
        case .latest_launches:
            return "4"
        }
    }
    
    var method: MoyaMethod {
        switch self {
        case .latest_launches:
            return .get
        }
    }
    
    var task: MoyaTask {
        switch self {
        case .latest_launches:
            return .requestPlain
        }
    }
    
    var isAuthorization: Bool {
        switch self {
        case .latest_launches:
            return false
        }
    }
}
