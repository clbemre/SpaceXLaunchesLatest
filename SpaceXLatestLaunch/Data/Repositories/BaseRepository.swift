//
//  BaseRepository.swift
//
//  Created by Yunus Emre Celebi
//

import Moya

typealias APIResponseCallback<T: Codable> = (T?, NetworkError?) -> Void

protocol IBaseRepository { }

class BaseRepository<Target: TargetType>: IBaseRepository {

    private var provider: MoyaProvider<Target>

    init(provider: MoyaProvider<Target>) {
        self.provider = provider
    }
    
    func mRequest<T: Codable>(_ target: Target, callback: @escaping APIResponseCallback<T>) {
        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                if statusCode == 400 {
                    callback(nil, .bad_request)
                } else if statusCode == 401 {
                    callback(nil, .authorized)
                } else if statusCode == 404 {
                    callback(nil, .not_found)
                } else if statusCode == 500 {
                    callback(nil, .server)
                } else if (statusCode >= 200 && statusCode < 300) || statusCode == 422 {
                    do {
                        let response = try JSONDecoder().decode(T.self, from: response.data)
                        callback(response, nil)
                    } catch (let error) {
                        print("unknown_data -> \(error)")
                        callback(nil, .unknown_data(error: error))
                    }
                } else {
                    callback(nil, .common_error_message)
                }
            case .failure(let error):
                switch error {
                case .underlying(let underlyingError, _):
                    switch underlyingError.asAFError {
                    case .sessionTaskFailed(let sessionTaskFailedError):
                        let nsErrorCode = (sessionTaskFailedError as NSError).code
                        if nsErrorCode == -1009 { // -1009 alamofire no internet code
                            callback(nil, .no_internet)
                        } else if nsErrorCode == NSURLErrorTimedOut {
                            callback(nil, .timed_out)
                        } else {
                            callback(nil, .common_error_message)
                        }
                    default:
                        callback(nil, .common_error_message)
                    }
                default:
                    callback(nil, .common_error_message)
                }
            }
        }
    }
}
