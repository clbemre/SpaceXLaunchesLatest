//
//  LottieProgressView.swift
//
//  Created by Yunus Emre Celebi
//

import UIKit
import Lottie
import SnapKit

class LottieProgressView: BaseReusableView {

    private lazy var animationView: LottieAnimationView = {
        let view = LottieAnimationView(nameKey: .lottie_loading_progress)
        view.contentMode = .scaleAspectFit
        view.loopMode = .loop

        addSubview(view)
        return view
    }()

    override func initializeComponent() {
        alpha = 0
        backgroundColor = .an_white
        setupViews()
    }

    func playAnimation(isPlay: Bool) {
        if isPlay {
            playAnimation()
        } else {
            stopAnimation()
        }
    }

    func playAnimation(isPlay: Bool, parentView: UIView?) {
        if isPlay {
            playAnimation(parentView: parentView)
        } else {
            stopAnimation()
        }
    }

    func playAnimation() {
        if let window = WindowHelper.getWindow() {
            window.addSubview(self)
            self.snp.makeConstraints { maker in
                maker.edges.equalToSuperview()
            }
            window.bringSubviewToFront(self)
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.alpha = 1.0
            }
            animationView.play()
        }
    }

    func playAnimation(parentView: UIView?) {
        if let parentView = parentView {
            parentView.addSubview(self)
            self.snp.makeConstraints { maker in
                maker.edges.equalToSuperview()
            }
            parentView.bringSubviewToFront(self)
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.alpha = 1.0
            }
            animationView.play()
        }
    }

    func stopAnimation() {
        UIView.animate(withDuration: 0.1) { [weak self] in
            self?.alpha = 0
        } completion: { [weak self] completed in
            self?.removeFromSuperview()
            self?.animationView.stop()
        }
    }
}

private extension LottieProgressView {

    func setupViews() {
        addSubview(animationView)
        animationView.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
            maker.width.equalTo(CGFloat(200).adjustWidthRespectToDesignRate())
            maker.height.equalTo(CGFloat(175).adjustHeightRespectToDesignRate())
        }
    }
}

