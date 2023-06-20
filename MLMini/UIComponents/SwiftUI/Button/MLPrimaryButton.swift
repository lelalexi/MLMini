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
                .foregroundColor(.white)
        }
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .background(Color(uiColor: .activeBlue))
        .cornerRadius(8)
    }
}
