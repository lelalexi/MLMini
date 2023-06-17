//
//  MLGenericFeedbackScreenComponentSnapshotTests.swift
//  MLMiniTests
//
//  Created by Alexis Garcia Carli on 16/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import UIKit
import SnapshotTesting
@testable import MLMini

class MLGenericFeedbackScreenComponentSnapshotTests: MLBaseSnapshotTests {
    var feedbackView: MLGenericFeedbackScreenComponent!
    var feedbackViewController: UIViewController!
    
    override func setUp() {
        super.setUp()
        isRecording = false
        feedbackView = MLGenericFeedbackScreenComponent()
        feedbackViewController = UIViewController()
        feedbackViewController.view = feedbackView
    }
    
    func testFeedback_ItemNotFound_Screen() {
        feedbackView.type = .itemNotFound
        verifySnapshotfor(viewController: feedbackViewController,
                          withName: "FeedbackItemNotFoundViewSnapshot")
    }
    
    func testFeedback_Error_Screen() {
        feedbackView.type = .miscError
        verifySnapshotfor(viewController: feedbackViewController,
                          withName: "FeedbackErrorViewSnapshot")
    }
}
