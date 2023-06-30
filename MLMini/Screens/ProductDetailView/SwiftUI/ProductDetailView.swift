//
//  ProductDetailView.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 27/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import Combine
import SwiftUI

struct ProductDetailView: View {
    @ObservedObject var viewModel: ProductDetailViewModel

    private var itemDetailModel: ItemDetailDomainModel { viewModel.itemDetailModel }
    private var itemDescriptionModel: ItemDescriptionDomainModel { viewModel.itemDescriptionModel }
    
    init(viewModel: ProductDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 8) {
                renderTopRowSection(model: itemDetailModel)
                renderImageCarouselSection(model: itemDetailModel)
                ProductDetailItemPricingSection(model: itemDetailModel)
                renderSellerReputationSection(model: $viewModel.userInformationModel)
                ProductDetailDescriptionSection(descriptionBody: itemDescriptionModel.description)
            }
            .padding(.horizontal, MLSpacings.defaultMargin)
        }
    }
}

extension ProductDetailView {
    @ViewBuilder private func renderTopRowSection(model: ItemDetailDomainModel) -> some View {
        ProductDetailTopRow(itemCondition: model.condition,
                            soldItems: String(model.soldQuantity),
                            publicationTitle: model.title)
        .padding(.top, 8)
    }
    
    @ViewBuilder private func renderImageCarouselSection(model: ItemDetailDomainModel) -> some View {
        let images: [URL] = model.pictures.map { URL(string: $0)! }
        ProductDetailCarouselView(images: images)
            .frame(height: 300)
            .padding(.horizontal, -MLSpacings.defaultMargin)
    }
    
    @ViewBuilder private func renderSellerReputationSection(model: Binding<MLUserInformationDomainModel>) -> some View {
        ProductDetailSellerSection(sellerReputation: model.sellerReputation)
            .frame(height: 80)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let itemToSearch = "MLA1388405828"
        let service = NetworkServiceManager()
        let repository = ProductDetailRepository(service)
        ProductDetailView(viewModel: ProductDetailViewModel(repository: repository,
                                                            itemId: itemToSearch))
    }
}
