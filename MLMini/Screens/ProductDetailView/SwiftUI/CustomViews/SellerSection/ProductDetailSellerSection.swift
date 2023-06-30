//
//  ProductDetailSellerSection.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 28/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import SwiftUI

struct ProductDetailSellerSection: View {
    @Binding var sellerReputation: MLSellerReputationDomainModel
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Divider()
                renderTopLabel
                SellerQualityMeter(widthSize: geometry.size.width, sellerReputation: $sellerReputation)
            }
        }
    }
}

extension ProductDetailSellerSection {
    @ViewBuilder private var renderTopLabel: some View {
        Text(MLLocalizables.ProductDetailView.sellerSectionTitle)
            .font(.custom("Avenir-Book", size: 20))
            .foregroundColor(Color.primaryText)
            .padding(.bottom, 8)
    }
}

struct ProductDetailSellerSection_Previews: PreviewProvider {
    var sellerLevel: MLSellerReputationDomainModel = MLSellerReputationDomainModel(levelId: .Level3)
    static var previews: some View {
        let sellerLevel: Binding<MLSellerReputationDomainModel> = .constant(MLSellerReputationDomainModel(levelId: .Level3))
         ProductDetailSellerSection(sellerReputation: sellerLevel)
            .padding(.horizontal, MLSpacings.defaultMargin)
    }
}
