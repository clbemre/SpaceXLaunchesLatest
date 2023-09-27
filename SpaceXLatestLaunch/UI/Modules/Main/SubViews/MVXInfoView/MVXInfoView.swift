//
//  MVXInfoView.swift
//  SpaceXLatestLaunch
//
//  Created by Yunus Emre Celebi on 27.09.2023.
//

import UIKit

class MVXInfoView: BaseReusableNibView {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelFlightNumber: UILabel!

    override func initializeComponent() {
        self.backgroundColor = .clear
    }

    func configureView(name: String, flight_number: Int) {
        self.labelName.text = name
        self.labelFlightNumber.makeLocalizeText(.str_flight_number, param: "\(flight_number)")
    }
}

