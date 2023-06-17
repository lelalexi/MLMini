//
//  MLMiniTextFieldSnapshotTests.swift
//  MLMiniTests
//
//  Created by Alexis Garcia Carli on 17/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import SnapshotTesting
import SwiftUI
@testable import MLMini

class MLMiniTextFieldSnapshotTests: MLBaseSnapshotTests {
    var textFieldView: UIView!
    @State var text: String = ""

    override func setUp() {
        super.setUp()
        isRecording = false
        let button = MLMiniTextField(text: $text, placeholder: "Search on Mercadolibre")
        textFieldView = UIHostingController(rootView: button).view
        textFieldView.frame = CGRect(x: 0, y: 0, width: 260, height: 50)
    }
    
    func testTextField_When_Empty() {
        verifySnapshotfor(view: textFieldView)
    }
}
