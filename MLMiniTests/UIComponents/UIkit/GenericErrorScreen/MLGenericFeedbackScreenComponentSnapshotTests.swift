//
//  MLGenericFeedbackScreenComponentSnapshotTests.swift
//  MLMiniTests
//
//  Created by Alexis Garcia Carli on 16/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

@testable import MLMini

class MLGenericFeedbackScreenComponentSnapshotTests: MLBaseSnapshotTests {
    var feedbackView: MLGenericFeedbackScreenComponent!
    
    override func setUp() {
        super.setUp()
        feedbackView = MLGenericFeedbackScreenComponent()
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
}
