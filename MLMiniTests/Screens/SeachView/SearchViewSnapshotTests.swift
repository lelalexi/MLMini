//
//  SearchViewSnapshotTests.swift
//  MLMiniTests
//
//  Created by Alexis Garcia Carli on 17/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import SwiftUI
@testable import MLMini

class SearchViewSnapshotTests: MLBaseSnapshotTests {
    override func setUp() {
        super.setUp()
        let searchView = SearchViewBuilder().getView(forController: UIViewController())
        let searchViewController = UIHostingController(rootView: searchView)
        viewController = searchViewController
    }
    
    func testSearchScreen() {
        verifyFeedbackViewSnapshot(withName: "SearchScreenSnapshot")
    }
}
