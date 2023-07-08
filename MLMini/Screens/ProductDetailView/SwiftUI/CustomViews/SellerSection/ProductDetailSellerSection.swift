//
//  ProductDetailSellerSection.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 28/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import SwiftUI

struct ProductDetailSellerSection: View {
    @Binding var viewState: MLDataState<MLSellerReputationDomainModel>
    var body: some View {
        switch viewState {
        case .isLoading:
            detailSellerSection(withSellerReputation: .constant(._default))
                .redacted(reason: .placeholder)
        case .success(let sellerReputation):
            detailSellerSection(withSellerReputation: .constant(sellerReputation))
        case .error:
            EmptyView()
        }
    }
}

extension ProductDetailSellerSection {
    @ViewBuilder private func detailSellerSection(withSellerReputation sellerReputation: Binding<MLSellerReputationDomainModel>) -> some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Divider()
                renderTopLabel
                SellerQualityMeter(widthSize: geometry.size.width, sellerReputation: sellerReputation)
            }
        }
    }
    
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
        Group {
            ProductDetailSellerSection(viewState: .constant(.isLoading))
            ProductDetailSellerSection(viewState: .constant(.success(model: MLSellerReputationDomainModel(levelId: .Level4))))
        }
        .padding(.horizontal, MLSpacings.defaultMargin)
    }
}
