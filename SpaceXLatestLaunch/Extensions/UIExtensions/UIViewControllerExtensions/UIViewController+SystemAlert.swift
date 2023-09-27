//
//  UIViewController+SystemAlert.swift
//  SpaceXLatestLaunch
//
//  Created by Yunus Emre Celebi on 27.09.2023.
//

import UIKit
import Localize

typealias SystemAlertCallback = (() -> Void)

enum AlertPreferredActionType {
    case positive
    case negative
    case nothing
}


// MARK: Alert
extension UIViewController {

    // Success
    func showSuccessAlert(message: String, callbackPositiveButton: SystemAlertCallback? = nil) {
        self.showSystemAlert(title: fetchLocalizeString(key: .str_success),
                             message: message,
                             positiveButtonClickListener: callbackPositiveButton)
    }

    func showSuccessAlert(messageKey: GeneralLocalizeKeys, callbackPositiveButton: SystemAlertCallback? = nil) {
        self.showSystemAlert(title: fetchLocalizeString(key: .str_success),
                             message: messageKey.make(),
                             positiveButtonClickListener: callbackPositiveButton)
    }

    // Warning
    func showWarningAlert(message: String, callbackPositiveButton: SystemAlertCallback? = nil) {
        self.showSystemAlert(title: fetchLocalizeString(key: .str_warning),
                             message: message,
                             positiveButtonClickListener: callbackPositiveButton)
    }

    func showWarningAlert(messageKey: GeneralLocalizeKeys, callbackPositiveButton: SystemAlertCallback? = nil) {
        self.showSystemAlert(title: fetchLocalizeString(key: .str_warning),
                             message: messageKey.make(),
                             positiveButtonClickListener: callbackPositiveButton)
    }


    // Error
    func showErrorAlert(message: String, callbackPositiveButton: SystemAlertCallback? = nil) {
        self.showSystemAlert(title: fetchLocalizeString(key: .str_error),
                             message: message,
                             positiveButtonClickListener: callbackPositiveButton)
    }

    func showErrorAlert(messageKey: GeneralLocalizeKeys, callbackPositiveButton: SystemAlertCallback? = nil) {
        self.showSystemAlert(title: fetchLocalizeString(key: .str_error),
                             message: messageKey.make(),
                             positiveButtonClickListener: callbackPositiveButton)
    }

    func showSystemAlert(
        title: String,
        message: String,
        positiveButtonText: String? = "str_ok".localize(),
        positiveButtonClickListener: SystemAlertCallback? = nil,
        negativeButtonText: String? = nil,
        negativeButtonClickListener: SystemAlertCallback? = nil,
        preferredActionType: AlertPreferredActionType = .nothing,
        tintColor: UIColor = .spaceXBrandColor
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.view.tintColor = tintColor

        // Positive Action
        let posAction = UIAlertAction(title: positiveButtonText, style: .default,
                                      handler: { _ in
                                          positiveButtonClickListener?()
                                      })
        alert.addAction(posAction)

        // Negative Action
        var negAction: UIAlertAction? = nil
        if let negativeButtonText = negativeButtonText {
            negAction = UIAlertAction(title: negativeButtonText, style: .cancel,
                                      handler: { _ in
                                          negativeButtonClickListener?()
                                      })
            alert.addAction(negAction!)
        }

        switch preferredActionType {
        case .positive:
            alert.preferredAction = posAction
        case .negative:
            alert.preferredAction = negAction
        case .nothing:
            alert.preferredAction = nil
        }

        present(alert, animated: true, completion: nil)
    }
}
