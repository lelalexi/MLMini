//
//  MLPrimaryButtonSnapshotTests.swift
//  MLMiniTests
//
//  Created by Alexis Garcia Carli on 17/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import SnapshotTesting
import SwiftUI
@testable import MLMini

class MLPrimaryButtonSnapshotTests: MLBaseSnapshotTests {
    var buttonView: UIView!
    override func setUp() {
        super.setUp()
        let button = PrimaryButton(label: "Search", onButtonTapped: { print("Button Tapped") })
        buttonView = UIHostingController(rootView: button).view
        buttonView.frame = CGRect(x: 0, y: 0, width: 260, height: 50)
    }
    
    func testSearchScreen() {
        assertSnapshot(matching: buttonView, as: .image(drawHierarchyInKeyWindow: true), record: false)
    }
}
