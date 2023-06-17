//
//  SearchViewSnapshotTests.swift
//  MLMiniTests
//
//  Created by Alexis Garcia Carli on 17/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import SwiftUI
import SnapshotTesting
@testable import MLMini

class SearchViewSnapshotTests: MLBaseSnapshotTests {
    var searchViewController: UIViewController!

    override func setUp() {
        super.setUp()
        isRecording = false
        let searchView = SearchViewBuilder().getView(forController: UIViewController())
        searchViewController = UIHostingController(rootView: searchView)
    }
    
    func testSearchScreen() {
        verifySnapshotfor(viewController: searchViewController,
                          withName: "SearchScreenSnapshot")
    }
}
