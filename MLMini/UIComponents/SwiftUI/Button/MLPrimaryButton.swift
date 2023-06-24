//
//  MLPrimaryButton.swift
//  MLMini
//

import SwiftUI

struct PrimaryButton: View {
    var label: String
    var onButtonTapped: () -> Void
    var body: some View {
        Button {
            onButtonTapped()
        } label: {
            Text(label)
                .font(.custom("Avenir-Medium", size: 20))
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .foregroundColor(.invertedText)
        }
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .background(Color.activeBlue)
        .cornerRadius(8)
    }
}

// swiftlint: disable no_direct_standard_out_logs
struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(label: MLLocalizables.SearchView.buttonTitle) {
            print("Button Was Pressed")
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
// swiftlint: enable no_direct_standard_out_logs
