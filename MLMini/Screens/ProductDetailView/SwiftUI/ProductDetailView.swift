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
    @State var userInformationModel2: MLUserInformationDomainModel

    private var itemDetailModel: ItemDetailDomainModel { viewModel.itemDetailModel }
    private var itemDescriptionModel: ItemDescriptionDomainModel { viewModel.itemDescriptionModel }
    private var sellerReputationModel: Binding<MLSellerReputationDomainModel> { $viewModel.userInformationModel.sellerReputation }
    private var images: [URL] { itemDetailModel.pictures.map { URL(string: $0)! } }
    
    init(viewModel: ProductDetailViewModel) {
        self.viewModel = viewModel
        userInformationModel2 = viewModel.userInformationModel
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 8) {
                ProductDetailTopRow(itemCondition: itemDetailModel.condition,
                                    soldItems: String(itemDetailModel.soldQuantity),
                                    publicationTitle: itemDetailModel.title)
                ProductDetailCarouselView(images: images)
                ProductDetailItemPricingSection(model: itemDetailModel)
                ProductDetailSellerSection(sellerReputation: sellerReputationModel)
                    .frame(height: 80)
                ProductDetailDescriptionSection(descriptionBody: itemDescriptionModel.description)
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
