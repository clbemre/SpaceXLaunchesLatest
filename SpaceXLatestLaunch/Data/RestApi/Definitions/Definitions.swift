//
//  Definitions.swift
//
//  Created by Yunus Emre Celebi
//

import Moya

// MARK: Provider
func createMoyaProvider<Target: TargetType>(targetType: Target.Type) -> MoyaProvider<Target> {
    // let provider = MoyaProvider<Target>(plugins: [NetworkLoggerPlugin(configuration: .init())])
    let provider = MoyaProvider<Target>()
    provider.session.sessionConfiguration.timeoutIntervalForRequest = 120
    return provider
}

// MARK: RequestParameters
typealias APIRequestParameters = [String: Any]

// MARK: Typealiases
typealias MoyaMethod = Moya.Method
typealias MoyaTask = Task

// MARK: Definitions
let DefaultJSONEncoding = JSONEncoding.default
let DefaultURLEncoding = URLEncoding.default

// MARK: TargetType - Header
public protocol MTargetType: TargetType {

    var isAuthorization: Bool { get }
    var endPointVersion: String { get }
}

extension MTargetType {

    var baseURL: URL {
        return URL(string: NetworkUtil.environmentBaseURL)!
    }

    public var headers: [String: String]? {
        let headers: [String: String] = [
            "Content-Type": "application/json; charset=utf-8",
            "Accept": "application/json; charset=utf-8"
        ]

        if isAuthorization {
            //  headers["Authorization"] = "Bearer \(authToken)"
        }

        return headers
    }

    var sampleData: Data {
        return Data()
    }

    func generateEndPoint(lastPath: String) -> String {
        return NetworkUtil.generateEndPoint(lastPath: "/v\(endPointVersion)/\(lastPath)")
    }
}

