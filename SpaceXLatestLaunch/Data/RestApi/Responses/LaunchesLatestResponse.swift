//
//  LaunchesLatestResponse.swift
//  SpaceXLatestLaunch
//
//  Created by Yunus Emre Celebi on 26.09.2023.
//

import Foundation

struct LaunchesLatestResponse: Codable {

    let name: String
    let flight_number: Int
    let links: LatestLaunchesLinksModel

    // dökümanda kullanılmasını istemişsiniz
    // ancak response içerisinde ki bu değer null dönüyor
    // let details

    static func emptyInstance() -> LaunchesLatestResponse {
        return .init(name: "", flight_number: -1, links: .emptyInstance())
    }
}

struct LatestLaunchesLinksModel: Codable {

    let webcast: String
    let patch: LatestLaunchesPatchModel

    static func emptyInstance() -> LatestLaunchesLinksModel {
        return .init(webcast: "", patch: .emptyInstance())
    }
}

struct LatestLaunchesPatchModel: Codable {

    let small: String
    let large: String

    static func emptyInstance() -> LatestLaunchesPatchModel {
        return .init(small: "", large: "")
    }
}
