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
    private var model: ItemDetailDomainModel { viewModel.model ?? ItemDetailDomainModel._default }
    private var images: [URL] { model.pictures.map { URL(string: $0)! } }
    
    init(viewModel: ProductDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 8) {
                ProductDetailTopRow(itemCondition: model.condition,
                                    soldItems: String(model.soldQuantity),
                                    publicationTitle: model.title)
                ProductDetailCarouselView(images: images)
                ProductDetailItemPricingSection(model: model)
                ProductDetailSellerSection()
                    .frame(height: 80)
                ProductDetailDescriptionSection()
            }
        }
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
