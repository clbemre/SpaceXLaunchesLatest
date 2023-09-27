//
//  AppDelegate.swift
//  SpaceXLatestLaunch
//
//  Created by Yunus Emre Celebi on 26.09.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator? = nil

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Alamofire Network Logger
        initAlamofireNetworkLogger()

        // Localize
        initLocalize()

        // start App Coordinator
        startAppCoordinator()

        return true
    }

}

// MARK: Helper funcs
extension AppDelegate {

    private func startAppCoordinator() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.appCoordinator = AppCoordinator(window: window)
        self.window = window

        self.startFlowSplash()
    }

    func startFlowSplash() {
        self.appCoordinator?.start()
    }

    func startFlowMain() {
        self.appCoordinator?.startMainFlow()
    }
}
