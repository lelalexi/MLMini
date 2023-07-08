//
//  MLPreviewFormat.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 06/07/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import SwiftUI

struct MLPreviewFormat: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(MLSpacings.defaultMargin)
            .previewDevice("iPhone 13 mini")
            .previewLayout(.sizeThatFits)
    }
}
