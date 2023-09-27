//
//  MainViewController.swift
//  SpaceXLatestLaunch
//
//  Created by Yunus Emre Celebi on 26.09.2023.
//

import UIKit

class MainViewController: BaseViewController {

    private let viewModel: IMainViewModel
    private let coordinator: IMainCoordinator

    // MARK: Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var headerView: MVHeaderView!
    @IBOutlet weak var xInfoView: MVXInfoView!

    // MARK: Props
    
    private lazy var refreshControl: ANRefreshControl = {
        return .init()
    }()

    init(viewModel: IMainViewModel,
         coordinator: IMainCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: .nibName, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    override func initialComponents() {
        self.view.backgroundColor = .spaceXBrandColor

        // ScrollView
        self.scrollView.refreshControl = self.refreshControl
        self.refreshControl.listenPullToRefresh(isAutoEndRefreshing: true) {
            self.hiddenContent()
            self.viewModel.getLaunchesLatestService()
        }

        // Header View
        self.headerView.initializeComponent()

        // View Model
        self.viewModel.baseViewModelDelegate = self
        self.viewModel.outputDelegate = self

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // request
        self.hiddenContent()
        self.viewModel.getLaunchesLatestService()
    }

    override func registerEvents() {

    }

    func hiddenContent() {
        headerView.isHidden = true
        xInfoView.isHidden = true
    }

    func visibleContent() {
        headerView.isHidden = false
        xInfoView.isHidden = false
    }
}

extension MainViewController: MainViewModelOutputDelegate {

    func configureVideo(url: String) {
        self.headerView.configureVideo(url: url)
    }

    func configureXInfoView(name: String, flight_number: Int) {
        self.xInfoView.configureView(name: name, flight_number: flight_number)
    }

    func successGetLaunchesLatestService() {
        self.visibleContent()
    }

    func failGetLaunchesLatestService(errorMessage: String) {
        self.showErrorAlert(message: errorMessage)
    }
}

// MARK: File Private String Extension
fileprivate extension String {

    static let nibName: String = "MainViewController"
}
