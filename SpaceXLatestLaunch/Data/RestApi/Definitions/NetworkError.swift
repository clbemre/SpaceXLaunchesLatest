//
//  NetworkError.swift
//
//  Created by Yunus Emre Celebi
//

import Foundation

enum NetworkError {
    case no_internet
    case common_error_message
    case timed_out
    case authorized
    case server
    case not_found
    case bad_request
    case unknown_data(error: Error)
}

