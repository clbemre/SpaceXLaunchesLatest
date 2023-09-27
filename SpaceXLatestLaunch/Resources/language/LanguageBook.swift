//
//  LanguageBook.swift
//
//  Created by Yunus Emre Celebi
//

import Foundation
import Localize

typealias GeneralLocalizeKeys = LanguageBook.General

protocol Languageable {
    var rawLocalizeString: String { get }
}

extension Languageable {

    func make() -> String {
        return self.rawLocalizeString.localize()
    }

    func make(param: String) -> String {
        return self.rawLocalizeString.localize(value: param, tableName: nil)
    }

    func make(param1: String, param2: String) -> String {
        return self.rawLocalizeString.localize(values: param1, param2, tableName: nil)
    }

    func make(param1: String, param2: String, param3: String) -> String {
        return self.rawLocalizeString.localize(values: param1, param2, param3, tableName: nil)
    }
}

struct LanguageBook {

    enum General: String, Languageable {

        internal var rawLocalizeString: String {
            return self.rawValue
        }

        case str_splash_header
        case str_un_expected_error
        case str_success
        case str_warning
        case str_error
        case str_ok
        case str_check_network_connection
        case str_flight_number
    }
}
