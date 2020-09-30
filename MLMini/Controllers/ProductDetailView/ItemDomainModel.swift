//
//  ProductDetailDomainModel.swift
//  MLMini
//
//  Created by Alexis Garcia on 16/09/2020.
//  Copyright © 2020 ale. All rights reserved.
//

struct ItemModel {
    let id: String
    let price: Double
    let title: String
    let thumbnail: String
    let freeShipping: Bool
}

struct ItemDescriptionModel {
    let id: String
    let price: Double
    let title: String
    let pictures: [String]
    let soldQuantity: Int
    let thumbnail: String
    let availableItems: Int
}
