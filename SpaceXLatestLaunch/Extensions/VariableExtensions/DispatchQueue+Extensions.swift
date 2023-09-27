//
//  DispatchQueue+Extensions.swift
//
//  Created by Yunus Emre Celebi
//

import Foundation

extension DispatchQueue {

    static func delay(_ milliseconds: Int, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(milliseconds), execute: closure)
    }
}
