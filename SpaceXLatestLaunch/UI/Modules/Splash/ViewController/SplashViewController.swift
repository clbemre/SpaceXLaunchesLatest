//
//  SplashViewController.swift
//  SpaceXLatestLaunch
//
//  Created by Yunus Emre Celebi on 26.09.2023.
//

import UIKit
import Lottie

final class SplashViewController: BaseViewController {

    private let viewModel: ISplashViewModel
    private let coordinator: ISplashCoordinator

    init(viewModel: ISplashViewModel,
         coordinator: ISplashCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    override func initialComponents() {
        self.view.backgroundColor = .an_white
        setupAllConstraints()
        animationView.play()

        // viewModel
        self.viewModel.outputDelegate = self
        self.viewModel.checkAndContinueToApp()
    }

    // MARK: Define Components
    private lazy var animationView: LottieAnimationView = {
        let view = LottieAnimationView(nameKey: .lottie_splash_animation)
        view.contentMode = .scaleAspectFit
        view.loopMode = .loop

        self.view.addSubview(view)
        return view
    }()

    private lazy var labelText: UILabel = {
        let label = UILabel()
        // label.text = "SpaceX"
        // OR
        // label.text = fetchLocalizeString(key: .str_splash_header)
        // OR
        label.makeLocalizeText(.str_splash_header)
        label.textColor = .lightGray
        label.font = .fontJetBrainsMonoBold(size: 40)
        label.textAlignment = .center

        self.view.addSubview(label)
        return label
    }()
}

// MARK: SplashViewModelOutputDelegate
extension SplashViewController: SplashViewModelOutputDelegate {

    func preparedAppForMain() {
        self.coordinator.startMainFlow()
    }
}

// MARK: Setup UI
extension SplashViewController {

    func setupAllConstraints() {

        // Label Text
        labelText.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.topSafeArea(view: self.view).offset(36)
        }

        // Center Logo
        animationView.snp.makeConstraints { make in
            // make.bottom.equalToSuperview()
            make.center.equalToSuperview()
            make.width.equalTo(UIScreen.width * 2.2)
            make.height.equalTo(UIScreen.width * 2.2)
        }

        self.view.bringSubviewToFront(self.labelText)
    }
}
