//
//  MainViewModel.swift
//  SpaceXLatestLaunch
//
//  Created by Yunus Emre Celebi on 26.09.2023.
//

import Foundation

protocol IMainViewModel where Self: BaseViewModel {

    var outputDelegate: MainViewModelOutputDelegate? { get set }
    func getLaunchesLatestService()
}

protocol MainViewModelOutputDelegate: AnyObject {
    func successGetLaunchesLatestService()
    func failGetLaunchesLatestService(errorMessage: String)
    
    func configureVideo(url: String)
    func configureXInfoView(name: String, flight_number: Int)
}

class MainViewModel: BaseViewModel, IMainViewModel {

    private let repository: ILaunchesRepository
    weak var outputDelegate: MainViewModelOutputDelegate? = nil

    private var apiResponse: LaunchesLatestResponse = .emptyInstance()

    init(repository: ILaunchesRepository) {
        self.repository = repository
    }

    func getLaunchesLatestService() {
        self.handleProgress(isLoading: true)
        self.repository.launchesLatest { [weak self] response, error in
            self?.apiResponse = .emptyInstance()
            if let error = error {
                self?.handleApiError(error: error)
            } else if let response = response {
                self?.apiResponse = response
                self?.outputDelegate?.successGetLaunchesLatestService()
                
                // Update UI
                self?.outputDelegate?.configureVideo(url: response.links.webcast)
                self?.outputDelegate?.configureXInfoView(name: response.name, flight_number: response.flight_number)
            } else {
                self?.outputDelegate?.failGetLaunchesLatestService(errorMessage: fetchLocalizeString(key: .str_un_expected_error))
            }
            
            DispatchQueue.delay(500) {
                 self?.handleProgress(isLoading: false)
            }
        }
    }
}
