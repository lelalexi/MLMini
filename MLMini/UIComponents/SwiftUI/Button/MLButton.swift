//
//  MLPrimaryButton.swift
//  MLMini
//

import SwiftUI

struct MLButton: View {
    var label: String
    var style: MLButtonStyle
    var onButtonTapped: () -> Void
    
    var body: some View {
        Button(label) {
            onButtonTapped()
        }
        .buttonStyle(style)
    }
}

// swiftlint: disable no_direct_standard_out_logs
struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        MLButton(label: MLLocalizables.SearchView.buttonTitle, style: .primary){
            print("Button Was Pressed")
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
// swiftlint: enable no_direct_standard_out_logs
