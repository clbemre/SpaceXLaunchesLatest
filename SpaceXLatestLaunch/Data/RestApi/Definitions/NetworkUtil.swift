//
//  NetworkUtil.swift
//
//  Created by Yunus Emre Celebi
//

import Foundation

enum APIEnvironment {
    case development
    case production
}

struct NetworkUtil {

    private static var environment: APIEnvironment {
        return .development
    }

    static var environmentBaseURL: String {
        switch NetworkUtil.environment {
        case .production: return "https://api.spacexdata.com"
        case .development: return "https://api.spacexdata.com"
        }
    } 

    static func generateEndPoint(lastPath: String) -> String {
        return "\(lastPath)"
    }
}

