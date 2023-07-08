//
//  ProductDetailDescriptionSection.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 28/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import SwiftUI

struct ProductDetailDescriptionSection: View {
    var viewState: MLDataState<ItemDescriptionDomainModel>
    var body: some View {
        switch viewState {
        case .isLoading:
            descriptionSectionContent(withDescription: ItemDescriptionDomainModel._default.description)
                .redacted(reason: .placeholder)
        case .success(let itemDescription):
            descriptionSectionContent(withDescription: itemDescription.description)
        case .error:
            EmptyView()
        }
    }
}

extension ProductDetailDescriptionSection {
    @ViewBuilder private func descriptionSectionContent(withDescription descriptionBody: String) -> some View {
        VStack(alignment: .leading, spacing: 20) {
            Divider()
            Text(MLLocalizables.ProductDetailView.descriptionSectionTitle)
                .font(.custom("Avenir-Book", size: 22))
                .foregroundColor(Color.primaryText)
            Text(descriptionBody)
                .font(.custom("Avenir-Book", size: 16))
                .foregroundColor(Color.secondaryText)
        }
    }
}

struct ProductDetailDescriptionSection_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProductDetailDescriptionSection(viewState: .isLoading)
                .previewDisplayName("Loading State")
            ProductDetailDescriptionSection(viewState: .success(model: ItemDescriptionDomainModel._default))
                .previewDisplayName("Data Loaded")
        }
        .toPreviewFormat()
    }
}
