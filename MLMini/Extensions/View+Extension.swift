//
//  View+Extension.swift
//  MLMini
//

import SwiftUI

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                    .padding(.horizontal)
                self
            }
        }
    
    /// View Formatter for SwiftUI previews
    /// - Returns: a new View with correct format to be shown at SwiftUI previews
    func toPreviewFormat() -> some View {
        return modifier(MLPreviewFormat())
    }
}
