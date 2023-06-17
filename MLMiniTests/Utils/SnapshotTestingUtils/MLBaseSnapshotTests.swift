//
//  MLBaseSnapshotTests.swift
//  MLMiniTests
//
//  Created by Alexis Garcia Carli on 16/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import XCTest
import SnapshotTesting

class MLBaseSnapshotTests: XCTestCase {
    var viewController: UIViewController!
    var snapshotTestTargetDevices: [String : ViewImageConfig] = [ "iPhone 8" :.iPhone8,
                                                                  "iPhone Xs Max" :.iPhoneXsMax,
                                                                  "iPad Pro 11" :.iPadPro11 ]
    override func setUp() {
        viewController = UIViewController()
    }
    
    func verifyFeedbackViewSnapshot(withName: String) {
        let result = snapshotTestTargetDevices.map { device in
            verifySnapshot(matching: viewController,
                           as: .image(on: device.value),
                           named: "\(withName)_\(device.key)",
                           record: isRecording)
        }
        result.forEach { XCTAssertNil($0) }
    }
}
