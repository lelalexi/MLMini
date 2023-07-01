//
//  ProductDetailItemPricingSection.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 27/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import SwiftUI

struct ProductDetailItemPricingSection: View {
    @Binding var isLoading: Bool
    var model: ItemDetailDomainModel
    var primaryButtonAction: (() -> Void)?
    var secondaryButtonAction: (() -> Void)?
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("$ " + String(model.price.formattedWithSeparator))
                .font(.custom("Avenir-Book", size: 26))
                .kerning(0)
                .foregroundColor(Color.primaryText)
            Text("Ver los medios de pago")
                .font(.custom("Avenir-Book", size: 12))
                .foregroundColor(Color.activeBlue)
                .padding(.bottom, 8)
            MLButton(label: MLLocalizables.ProductDetailView.buyButtonLabel,
                     style: .primary) {
                primaryButtonAction?()
            }
            MLButton(label: MLLocalizables.ProductDetailView.addToCartButtonLabel,
                     style: .secondary) {
                secondaryButtonAction?()
            }
        }.redacted(reason: isLoading ? .placeholder : [])
    }
}

struct ProductDetailItemPricingSection_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailItemPricingSection(isLoading: .constant(true),
                                        model: ItemDetailDomainModel._default)
            .padding(.horizontal, MLSpacings.defaultMargin)
    }
}
