//
//  ProductDetailView.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 27/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import Combine
import SwiftUI

struct ProductDetailView<ViewModel>: View where ViewModel: ProductDetailViewModel {
    @ObservedObject var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 8) {
                renderTopRowSection()
                renderImageCarouselSection(itemDetailViewState: viewModel.itemDetailState)
                ProductDetailItemPricingSection(viewState: viewModel.itemDetailState)
                renderSellerReputationSection()
                ProductDetailDescriptionSection(viewState: viewModel.itemDescriptionState)
            }
            .padding(.horizontal, MLSpacings.defaultMargin)
        }
    }
}

extension ProductDetailView {
    @ViewBuilder private func renderTopRowSection() -> some View {
        ProductDetailTopRow(viewState: viewModel.itemDetailState)
        .padding(.top, 8)
    }
    
    @ViewBuilder private func renderImageCarouselSection(itemDetailViewState: MLDataState<ItemDetailDomainModel>) -> some View {
        switch itemDetailViewState {
        case .isLoading:
            imageCarousel()
                .redacted(reason: .placeholder)
        case .success(let model):
            imageCarousel(imagesLinkArray: model.pictures)
        case .error:
            EmptyView()
        }
    }
    
    @ViewBuilder private func imageCarousel(imagesLinkArray: [String] = []) -> some View {
        let images: [URL] = imagesLinkArray.map { URL(string: $0)! }
        ProductDetailCarouselView(images: images)
            .frame(height: 300)
            .padding(.horizontal, -MLSpacings.defaultMargin)
    }
    
    @ViewBuilder private func renderSellerReputationSection() -> some View {
        ProductDetailSellerSection(viewState: $viewModel.sellerInformationState)
            .frame(height: 80)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let itemToSearch = "MLA1388405828"
        let service = NetworkServiceManager()
        let repository = ProductDetailRepository(service)
        ProductDetailView(viewModel: ProductDetailViewModelDefault(repository: repository,
                                                                   itemId: itemToSearch))
        .previewDevice("iPhone 13 mini")
    }
}

enum MLDataState<Model> {
    case isLoading
    case success(model: Model)
    case error
}
