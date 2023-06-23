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
                .font(.title2)
                .bold()
                .foregroundColor(.invertedText)
        }
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .background(Color.activeBlue)
        .cornerRadius(8)
    }
}
