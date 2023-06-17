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
    var snapshotTestTargetDevices: [String : ViewImageConfig] = [ "iPhone 8" :.iPhone8,
                                                                  "iPhone Xs Max" :.iPhoneXsMax,
                                                                  "iPad Pro 11" :.iPadPro11 ]
    
    func verifySnapshotfor(viewController: UIViewController,
                           withName: String) {
        let result = snapshotTestTargetDevices.map { device in
            SnapshotTesting.verifySnapshot(matching: viewController,
                           as: .image(on: device.value),
                           named: "\(withName)_\(device.key)",
                           record: isRecording)
        }
        result.forEach { XCTAssertNil($0) }
    }
    
    func verifySnapshotfor(view: UIView,
                           withName: String) {
        let result = snapshotTestTargetDevices.map { device in
            SnapshotTesting.verifySnapshot(matching: view,
                           as: .image(precision: 0.99),
                           named: "\(withName)_\(device.key)",
                           record: isRecording)
        }
        result.forEach { XCTAssertNil($0) }
    }
}
