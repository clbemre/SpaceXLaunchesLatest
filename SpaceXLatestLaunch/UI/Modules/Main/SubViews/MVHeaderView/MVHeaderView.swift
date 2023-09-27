//
//  MVHeaderView.swift
//  SpaceXLatestLaunch
//
//  Created by Yunus Emre Celebi on 27.09.2023.
//

import UIKit

class MVHeaderView: BaseReusableNibView {

    @IBOutlet weak var videoView: YouTubePlayerView!

    override func initializeComponent() {
        self.backgroundColor = .clear
    }

    func configureVideo(url: String) {
        if let videoURL = URL(string: url) {
            self.videoView.loadVideoURL(videoURL)
        }
    }
}
