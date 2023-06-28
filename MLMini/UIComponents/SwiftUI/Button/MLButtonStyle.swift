//
//  MLButtonStyle.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 24/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import SwiftUI

struct MLButtonStyle: ButtonStyle {
    private let backgroundColor: Color
    private let backgroundColorWhenTapped: Color
    private let titleColor: Color
    
    static var primary: MLButtonStyle {
        return MLButtonStyle(backgroundColor: .activeBlue,
                             backgroundColorWhenTapped: .darkBlue,
                             titleColor: .invertedText)
    }
    
    static var secondary: MLButtonStyle {
        return MLButtonStyle(backgroundColor: .softBlue,
                             backgroundColorWhenTapped: .darkBlue.opacity(0.2),
                             titleColor: .activeBlue)
    }
    
    static var tertiary: MLButtonStyle {
        return MLButtonStyle(backgroundColor: .clear,
                             backgroundColorWhenTapped: .softBlue,
                             titleColor: .activeBlue)
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.custom("Avenir-Medium", size: 20))
            .multilineTextAlignment(.center)
            .lineLimit(1)
            .padding(.horizontal, 16)
            .foregroundColor(titleColor)
            .frame(maxWidth: .infinity)
            .clipShape(Rectangle())
            .frame(height: 50)
            .background(!configuration.isPressed ? backgroundColor : backgroundColorWhenTapped)
            .cornerRadius(6)
    }
}

// swiftlint: disable no_direct_standard_out_logs
struct MLButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Button(MLLocalizables.SearchView.buttonTitle) {
                print("Button Was Pressed")
            }
            .previewDisplayName("Primary Button")
            .buttonStyle(MLButtonStyle.primary)
            Button(MLLocalizables.SearchView.buttonTitle) {
                print("Button Was Pressed")
            }
            .previewDisplayName("Secondary Button")
            .buttonStyle(MLButtonStyle.secondary)
            Button(MLLocalizables.SearchView.buttonTitle) {
                print("Button Was Pressed")
            }
            .previewDisplayName("Tertiary Button")
            .buttonStyle(MLButtonStyle.tertiary)
        }
            .previewLayout(.sizeThatFits)
            .padding()
            
    }
}
// swiftlint: enable no_direct_standard_out_logs
