//
//  AppDelegate+Setups.swift
//  SpaceXLatestLaunch
//
//  Created by Yunus Emre Celebi on 26.09.2023.
//

import Foundation
import Localize

internal extension AppDelegate {

    func initAlamofireNetworkLogger() {
        AlamofireNetworkLogger.shared.startLogging()
        AlamofireNetworkLogger.shared.level = .debug
    }

    func initLocalize() {
        // Localize
        let localize = Localize.shared
        localize.update(provider: .json)
        localize.update(fileName: "lang")

        // set app language by device language
        let preferredLanguage = Locale.preferredLanguages[0] as String // telefon dili
        let arr = preferredLanguage.components(separatedBy: "-")
        if let deviceLanguage = arr.first {
            var saveableLanguage = deviceLanguage

            // just "tr" and "en"
            let availableLanguages = Localize.availableLanguages
            if let _ = availableLanguages.first(where: { lg in
                return deviceLanguage == lg
            }) {
                saveableLanguage = deviceLanguage
            } else {
                saveableLanguage = "en"
            }
            localize.update(defaultLanguage: saveableLanguage)
            localize.update(language: saveableLanguage.upperCasedTR())

        }
    }
}
