//
//  ItemAPIResponseModel.swift
//  MLMini
//
//  Created by Gaston Alexis Garcia Carli on 21/09/2019.
//  Copyright © 2019 ale. All rights reserved.
//

import Foundation

// MARK: - ItemDetailInfraestructureModel
struct ItemDetailInfraestructureModel: Codable {
    let id, title: String
    let sellerID: Int
    let categoryID: String
    let price: Double
    let availableQuantity, soldQuantity: Int
    let condition: String
    let permalink: String
    let thumbnail: String
    let pictures: [Picture]
    let descriptions: [Description]
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case sellerID = "seller_id"
        case categoryID = "category_id"
        case price
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case condition, permalink, thumbnail
        case pictures
        case descriptions
    }
}
//MARK: - ToModel
extension ItemDetailInfraestructureModel {
    func toModel() -> ItemDetailDomainModel {
        var itemImageArray = [String]()
        for pic in pictures{
            itemImageArray.append(pic.url)
        }
        return ItemDetailDomainModel(id: id,
                                     price: Double(price),
                                     title: title,
                                     condition: condition,
                                     pictures: itemImageArray,
                                     soldQuantity: soldQuantity,
                                     thumbnail: thumbnail,
                                     availableItems: availableQuantity)
    }
}

extension ItemDetailInfraestructureModel: Equatable {
    static func == (lhs: ItemDetailInfraestructureModel, rhs: ItemDetailInfraestructureModel) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: - Description
struct Description: Codable {
    let id: String
    
    init(id: String) {
        self.id = id
    }
}

// MARK: - Picture
struct Picture: Codable {
    let url: String
    let secureURL: String
    
    enum CodingKeys: String, CodingKey {
        case url
        case secureURL = "secure_url"
    }
    
    init(url: String, secureURL: String) {
        self.url = url
        self.secureURL = secureURL
    }
}
