//
//  ItemDetailDomainModel.swift
//  MLMini
//
//  Created by Alexis Garcia on 16/09/2020.
//  Copyright © 2020 ale. All rights reserved.
//

struct ItemDetailDomainModel: Identifiable {
    let id: String
    let price: Double
    let title: String
    let condition: String
    let pictures: [String]
    let soldQuantity: Int
    let thumbnail: String
    let availableItems: Int
}

extension ItemDetailDomainModel {
    static var _default: ItemDetailDomainModel {  ItemDetailDomainModel(id: "01",
                                                                        price: 1998.9,
                                                                        title: "Ops Vw 4k Sensores De Estacionamiento Scirocco Vento Golf",
                                                                        condition: "New",
                                                                        pictures: ["https://picsum.photos/200/300",
                                                                                   "https://picsum.photos/200/300",
                                                                                   "https://picsum.photos/200/300",
                                                                                   "https://picsum.photos/200/300"],
                                                                        soldQuantity: 10,
                                                                        thumbnail: "https://picsum.photos/200/300",
                                                                        availableItems: 5) }
}
