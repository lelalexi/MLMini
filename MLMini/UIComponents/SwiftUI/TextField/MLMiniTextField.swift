//
//  MLMiniTextField.swift
//  MLMini
//

import SwiftUI

struct MLMiniTextField: View {
    @Binding var text: String
    var placeholder: String
    var body: some View {
        ZStack {
            TextField("", text: $text)
                .foregroundColor(.primaryText)
                .padding(10)
                .placeholder(when: text.isEmpty) {
                    Text(placeholder)
                        .foregroundColor(.terciaryText)
                }
        }
          .frame(height: 50)
          .background(Color.primaryBackground)
          .overlay {
             RoundedRectangle(cornerRadius: 8)
                .stroke(.blue, lineWidth: 2)
           }
          .cornerRadius(8)
          
    }
}
