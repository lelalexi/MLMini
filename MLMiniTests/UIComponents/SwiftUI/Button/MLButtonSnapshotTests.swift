//
//  MLButtonSnapshotTests.swift
//  MLMiniTests
//
//  Created by Alexis Garcia Carli on 17/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import SnapshotTesting
import SwiftUI
@testable import MLMini

class MLButtonSnapshotTests: MLBaseSnapshotTests {
    private var viewWidth: CGFloat { ViewImageConfig.iPhoneXr.size?.width ?? 260 }
    private var buttonView: UIView!
    override func setUp() {
        super.setUp()
        isRecording = false
        let buttonsSwiftUIView = MultipleButtonsTestView()
        buttonView = UIHostingController(rootView: buttonsSwiftUIView).view
        buttonView.frame = CGRect(x: 0, y: 0, width: viewWidth, height: buttonView.frame.height)
    }
    
    func testButtons() {
        verifySnapshotfor(view: buttonView)
    }
}

extension MLButtonSnapshotTests {
    private struct MultipleButtonsTestView: View {
        private let buttonLabel = MLLocalizables.SearchView.buttonTitle.localized()
        private var onButtonPressed: (() -> Void)?
        var body: some View {
            VStack {
                MLButton(label: buttonLabel,
                         style: .primary) {
                    onButtonPressed?()
                }
                MLButton(label: buttonLabel,
                         style: .secondary) {
                    onButtonPressed?()
                }
                MLButton(label: buttonLabel,
                         style: .tertiary) {
                    onButtonPressed?()
                }
            }
            .padding()
        }
    }
}
