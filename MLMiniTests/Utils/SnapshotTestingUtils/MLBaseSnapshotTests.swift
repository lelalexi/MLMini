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
    static let snapshotTestTargetDevices: [String : ViewImageConfig] = [ "iPhone 8" :.iPhone8,
                                                                  "iPhone Xs Max" :.iPhoneXsMax,
                                                                  "iPad Pro 11" :.iPadPro11 ]
    
    func verifySnapshotfor(viewController: UIViewController,
                           withName: String = #function,
                           devices: [String : ViewImageConfig] = snapshotTestTargetDevices) {
        let result = MLBaseSnapshotTests.snapshotTestTargetDevices.map { device in
            verifySnapshot(matching: viewController,
                           as: .image(on: device.value),
                           named: "\(withName)_\(device.key)",
                           record: isRecording)
        }
        result.forEach { XCTAssertNil($0) }
    }
    
    func verifySnapshotfor(view: UIView,
                           withName: String = #function) {
        let result = verifySnapshot(matching: view,
                                    as: .image(precision: 0.99),
                                    named: "\(withName)",
                                    record: isRecording)
        XCTAssertNil(result)
    }
}
