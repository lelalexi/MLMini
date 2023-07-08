//
//  ProductDetailViewModelMock.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 28/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//


/*
import Combine
#warning("this should be a ProductDetailViewModel override instead")
class ProductDetailViewModelMock: ProductDetailViewModel {
    let updateDataPublisher: AnyPublisher<ItemDetailDomainModel, Never>
    
    private let updateData = PassthroughSubject<ItemDetailDomainModel, Never>()
    
    init() {
        updateDataPublisher = updateData.eraseToAnyPublisher()
        let data = getModel()
        updateData.send(data)
    }
    
    private func getModel() -> ItemDetailDomainModel {
        ItemDetailDomainModel(id: "01",
                              price: 1998.9,
                              title: "Ops Vw 4k Sensores De Estacionamiento Scirocco Vento Golf",
                              sellerID: 0,
                              condition: "New",
                              pictures: ["https://picsum.photos/200/300",
                                         "https://picsum.photos/200/300",
                                         "https://picsum.photos/200/300",
                                         "https://picsum.photos/200/300"],
                              soldQuantity: 10,
                              thumbnail: "https://picsum.photos/200/300",
                              availableItems: 5)
    }
}

extension ProductDetailViewModelMock {
    enum DataSource {
        case mockModel
        case api
    }
}
*/
