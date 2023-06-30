//
//  ItemDetailDomainModel.swift
//  MLMini
//
//  Created by Alexis Garcia on 16/09/2020.
//  Copyright © 2020 ale. All rights reserved.
//

struct ItemDetailDomainModel: Identifiable {
    var id: String
    var price: Double
    var title: String
    var sellerID: Int
    var condition: String
    var pictures: [String]
    var soldQuantity: Int
    var thumbnail: String
    var availableItems: Int
}

extension ItemDetailDomainModel {
    static var _default: ItemDetailDomainModel {  ItemDetailDomainModel(id: "01",
                                                                        price: 1998.9,
                                                                        title: "Ops Vw 4k Sensores De Estacionamiento Scirocco Vento Golf",
                                                                        sellerID: 1234,
                                                                        condition: "New",
                                                                        pictures: ["https://picsum.photos/200/300",
                                                                                   "https://picsum.photos/200/300",
                                                                                   "https://picsum.photos/200/300",
                                                                                   "https://picsum.photos/200/300"],
                                                                        soldQuantity: 10,
                                                                        thumbnail: "https://picsum.photos/200/300",
                                                                        availableItems: 5) }
}
