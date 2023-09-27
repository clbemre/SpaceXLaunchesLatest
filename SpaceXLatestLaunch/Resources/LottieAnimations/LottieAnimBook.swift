//
//  LottieAnimBook.swift
//  SpaceXLatestLaunch
//
//  Created by Yunus Emre Celebi
//

import UIKit
import Lottie

typealias LottieAnimKeys = LottieAnimBook.Anim

protocol LottieAnimable {
    var fileName: String { get }
}

extension LottieAnimable {
    func of() -> String {
        return fileName
    }
}

public struct LottieAnimBook {

    enum Anim: String, LottieAnimable {

        internal var fileName: String {
            return self.rawValue
        }

        case lottie_loading_progress
        case lottie_splash_animation
    }

}

// MARK: AnimationView
extension LottieAnimationView {

    convenience init(nameKey: LottieAnimKeys) {
        self.init(name: nameKey.of())
    }

    convenience init(nameKey: LottieAnimKeys,
                     bundle: Bundle = Bundle.main,
                     imageProvider: AnimationImageProvider? = nil,
                     animationCache: AnimationCacheProvider? = LRUAnimationCache.sharedCache) {
        self.init(name: nameKey.of(), bundle: bundle, imageProvider: imageProvider, animationCache: animationCache)
    }
}
