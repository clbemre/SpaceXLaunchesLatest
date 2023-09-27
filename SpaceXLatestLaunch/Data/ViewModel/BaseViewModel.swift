//
//  BaseViewModel.swift
//
//  Created by Yunus Emre Celebi
//

import Foundation

protocol IBaseViewModel: AnyObject {

    var baseViewModelDelegate: BaseViewModelDelegate? { get set }
}

protocol BaseViewModelDelegate: AnyObject {
    func handleProgress(isLoading: Bool)

    func apiErrorHandleNoInternet()
    func apiErrorHandleTimeOut()
    func apiErrorHandleCommonErrorMessage()
    func apiErrorHandleAuthorized()
    func apiErrorHandleServer()
    func apiErrorHandleBadRequest()
    func apiErrorHandleNotFound()
    func apiErrorHandleUnknownData(error: Error)
}

class BaseViewModel: IBaseViewModel {

    weak var baseViewModelDelegate: BaseViewModelDelegate? = nil

    func handleApiError(error: NetworkError) {
        switch error {
        case .no_internet:
            baseViewModelDelegate?.apiErrorHandleNoInternet()
        case .timed_out:
            baseViewModelDelegate?.apiErrorHandleTimeOut()
        case .common_error_message:
            self.triggeredCommonApiErrorMessage()
        case .authorized:
            baseViewModelDelegate?.apiErrorHandleAuthorized()
        case .server:
            baseViewModelDelegate?.apiErrorHandleServer()
        case .bad_request:
            baseViewModelDelegate?.apiErrorHandleBadRequest()
        case .not_found:
            baseViewModelDelegate?.apiErrorHandleNotFound()
        case .unknown_data(let error):
            baseViewModelDelegate?.apiErrorHandleUnknownData(error: error)
        }
    }

    func triggeredCommonApiErrorMessage() {
        self.baseViewModelDelegate?.apiErrorHandleCommonErrorMessage()
    }

    func handleProgress(isLoading: Bool) {
        self.baseViewModelDelegate?.handleProgress(isLoading: isLoading)
    }
}
