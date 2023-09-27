//
//  BaseViewController.swift
//
//  Created by Yunus Emre Celebi
//

import UIKit
import Lottie

class BaseViewController: UIViewController {

    deinit {
        print("killed: \(type(of: self))")
    }

    private var lottieProgressView: LottieProgressView?

    override func viewDidLoad() {
        super.viewDidLoad()
        initDidLoad()
    }

    // just base sub class
    internal func initDidLoad() {
        lottieProgressView = LottieProgressView()
        self.setupView()
        self.initialComponents()
        self.registerEvents()
    }

    // for subclasses
    func setupView() { }

    // for subclasses
    func initialComponents() { }

    // for subclasses
    func registerEvents() { }
}

// MARK: Props
internal extension BaseViewController {

    func changeNavigationBarTitle(mTitle: String) {
        self.navigationItem.title = mTitle
    }
}

// MARK: Lottie Progress View
extension BaseViewController {

    func playLoading(isLoading: Bool) {
        if isLoading {
            playLoading()
        } else {
            stopLoading()
        }
    }

    func playLoading() {
        lottieProgressView?.playAnimation()
    }

    func stopLoading() {
        lottieProgressView?.stopAnimation()
    }
}

// MARK: BaseViewModelDelegate
extension BaseViewController: BaseViewModelDelegate {

    func handleProgress(isLoading: Bool) {
        self.playLoading(isLoading: isLoading)
    }

    func apiErrorHandleNoInternet() {
        showErrorAlert(
            messageKey: .str_check_network_connection,
            callbackPositiveButton: { [unowned self] in
                print(type(of: self))
            })
    }

    func apiErrorHandleTimeOut() {
        showErrorAlert(
            message: fetchLocalizeString(key: .str_un_expected_error, param: "TO"),
            callbackPositiveButton: { [unowned self] in
                print(type(of: self))
            })
    }

    func apiErrorHandleCommonErrorMessage() {
        showErrorAlert(
            message: fetchLocalizeString(key: .str_un_expected_error, param: "C"),
            callbackPositiveButton: { [unowned self] in
                print(type(of: self))
            })
    }

    func apiErrorHandleAuthorized() {

    }

    func apiErrorHandleServer() {
        showErrorAlert(
            message: fetchLocalizeString(key: .str_un_expected_error, param: "S"),
            callbackPositiveButton: { [unowned self] in
                print(type(of: self))
            })
    }

    func apiErrorHandleBadRequest() {
        showErrorAlert(
            message: fetchLocalizeString(key: .str_un_expected_error, param: "BR"),
            callbackPositiveButton: { [unowned self] in
                print(type(of: self))
            })
    }

    func apiErrorHandleNotFound() {
        showErrorAlert(
            message: fetchLocalizeString(key: .str_un_expected_error, param: "NF"),
            callbackPositiveButton: { [unowned self] in
                print(type(of: self))
            })
    }

    func apiErrorHandleUnknownData(error: Error) {
        showErrorAlert(
            message: fetchLocalizeString(key: .str_un_expected_error, param: "UD"),
            callbackPositiveButton: { [unowned self] in
                print(type(of: self))
            })
    }
}
