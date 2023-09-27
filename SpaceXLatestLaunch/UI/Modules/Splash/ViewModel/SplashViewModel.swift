//
//  SplashViewModel.swift
//  SpaceXLatestLaunch
//
//  Created by Yunus Emre Celebi on 26.09.2023.
//

import Foundation

protocol SplashViewModelOutputDelegate: AnyObject {

    func preparedAppForMain()
}

protocol ISplashViewModel where Self: BaseViewModel {

    var outputDelegate: SplashViewModelOutputDelegate? { get set }

    // fake method
    func checkAndContinueToApp()
}

class SplashViewModel: BaseViewModel, ISplashViewModel {

    deinit {
        print("killed: \(type(of: self))")
    }

    weak var outputDelegate: SplashViewModelOutputDelegate? = nil

    func checkAndContinueToApp() {
        // check force update or anything in our api call
        // fake call
        DispatchQueue.delay(500) {
            self.outputDelegate?.preparedAppForMain()
        }
    }
}
