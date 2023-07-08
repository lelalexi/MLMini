//
//  ProductDetailTopRow.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 27/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import SwiftUI

struct ProductDetailTopRow: View {
    var viewState: MLDataState<ItemDetailDomainModel>
    
    var body: some View {
        switch viewState {
        case .isLoading:
            topRowSectionContent(model: ItemDetailDomainModel._default)
                .redacted(reason: .placeholder)
        case .success(let itemConditionAndSoldItemsModel):
            topRowSectionContent(model: itemConditionAndSoldItemsModel)
        case .error:
            EmptyView()
        }
    }
}

extension ProductDetailTopRow {
    private func calculateItemConditionAndSoldItems(withModel model: ItemDetailDomainModel) -> String {
        return model.condition + " | " + String(model.soldQuantity) + " " + MLLocalizables.ProductDetailView.soldItemsLabel
    }
    
    @ViewBuilder private func topRowSectionContent(model: ItemDetailDomainModel) -> some View {
        VStack (alignment: .leading, spacing: 4.0, content: {
            Text(calculateItemConditionAndSoldItems(withModel: model))
                .font(.custom("Avenir-Light", size: 12))
                .foregroundColor(Color.terciaryText)
            Text(model.title)
                .font(.custom("Avenir-Book", size: 16))
                .foregroundColor(Color.primaryText)
        })
        .multilineTextAlignment(.leading)
    }
}

struct ProductDetailTopRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProductDetailTopRow(viewState: .isLoading)
                .previewDisplayName("Loading State")
            ProductDetailTopRow(viewState: .success(model: ItemDetailDomainModel._default))
                .previewDisplayName("Loaded Data")
            ProductDetailTopRow(viewState: .error)
                .previewDisplayName("With Error")
        }
        .toPreviewFormat()
    }
}
