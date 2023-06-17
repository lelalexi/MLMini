//
//  MLGenericFeedbackScreenComponentSnapshotTests.swift
//  MLMiniTests
//
//  Created by Alexis Garcia Carli on 16/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import Foundation
import XCTest
import SnapshotTesting
@testable import MLMini

class MLGenericFeedbackScreenComponentSnapshotTests: XCTestCase {
    var feedbackView: MLGenericFeedbackScreenComponent!
    var viewController: UIViewController!
    
    var snapshotTestTargetDevices: [String : ViewImageConfig] = [ "iPhone 8" :.iPhone8,
                                                                  "iPhone Xs Max" :.iPhoneXsMax,
                                                                  "iPad Pro 11" :.iPadPro11 ]
    
    override func setUp() {
        feedbackView = MLGenericFeedbackScreenComponent()
        viewController = UIViewController()
        viewController.view = feedbackView
    }
    
    func testFeedback_ItemNotFound_Screen() {
        feedbackView.type = .itemNotFound
        verifyFeedbackViewSnapshot(withName: "FeedbackItemNotFoundViewSnapshot")
    }
    
    func testFeedback_Error_Screen() {
        feedbackView.type = .miscError
        verifyFeedbackViewSnapshot(withName: "FeedbackErrorViewSnapshot")
    }
    
    private func verifyFeedbackViewSnapshot(withName: String) {
        let result = snapshotTestTargetDevices.map { device in
            verifySnapshot(matching: viewController,
                           as: .image(on: device.value),
                           named: "\(withName)_\(device.key)",
                           record: false)
        }
        result.forEach { XCTAssertNil($0) }
    }
}
