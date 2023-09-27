//
//  CoordinatorDefinitions.swift
//
//  Created by Yunus Emre Celebi.
//

import UIKit

typealias DefaultDismissCallback = (() -> Void)

protocol ICoordinatorPassData { }

// MARK: Coordinator
protocol ICoordinator: AnyObject {

    var passData: ICoordinatorPassData? { set get }
    var willDismissCallback: DefaultDismissCallback? { get set }
    var didDismissCallback: DefaultDismissCallback? { get set }

    func start()

}

extension ICoordinator {

    func coordinate(to coordinator: ICoordinator) {
        coordinator.start()
    }

    // Builder pattern
    @discardableResult
    func with(passData: ICoordinatorPassData) -> ICoordinator {
        self.passData = passData
        return self
    }

    // Builder pattern
    @discardableResult
    func with(willDismissCallback: DefaultDismissCallback?) -> ICoordinator {
        self.willDismissCallback = willDismissCallback
        return self
    }

    // Builder pattern
    @discardableResult
    func with(didDismissCallback: DefaultDismissCallback?) -> ICoordinator {
        self.didDismissCallback = didDismissCallback
        return self
    }

    func castPassData<T: ICoordinatorPassData>(_ type: T.Type) -> T {
        guard let passData = passData as? T else { fatalError("undefined pass data struct -> \(T.self)") }
        return passData
    }

//    func topViewControllerNew() -> UIViewController? {
//        return UIApplication.topViewControllerNew()
//    }
}

// MARK: RootableCoordinator
class RootableCoordinator: NSObject, ICoordinator {

    internal var passData: ICoordinatorPassData?
    internal var willDismissCallback: DefaultDismissCallback?
    internal var didDismissCallback: DefaultDismissCallback?

    let window: UIWindow?

    init(window: UIWindow?) {
        self.window = window
    }

    deinit {
        print("killed: \(type(of: self))")
    }

    func start() {
        fatalError("Start method should be implemented.")
    }
}

// MARK: PresentationCoordinator
class PresentationCoordinator: NSObject, ICoordinator {

    deinit {
        print("killed: \(type(of: self))")
    }


    internal var passData: ICoordinatorPassData?
    internal var willDismissCallback: DefaultDismissCallback?
    internal var didDismissCallback: DefaultDismissCallback?

    weak var presenterViewController: UIViewController?

    init(presenterViewController: UIViewController?) {
        self.presenterViewController = presenterViewController
    }

    func start() {
        fatalError("Start method should be implemented.")
    }

    func startPresent(targetVC: UIViewController, animated: Bool = true) {
        presenterViewController?.presentViewController(targetVC, animated: animated)
    }

}

// MARK: NavigationCoordinator
class NavigationCoordinator: NSObject, ICoordinator {

    deinit {
        print("killed: \(type(of: self))")
    }

    internal var passData: ICoordinatorPassData?
    internal var willDismissCallback: DefaultDismissCallback?
    internal var didDismissCallback: DefaultDismissCallback?

    internal let navigationController: UINavigationController
    internal var lastViewController: UIViewController? {
        return self.navigationController.lastViewController
    }

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        fatalError("Start method should be implemented.")
    }

}
