//
//  ItemAPIResponseModel.swift
//  MLMini
//
//  Created by Gaston Alexis Garcia Carli on 21/09/2019.
//  Copyright © 2019 ale. All rights reserved.
//

import Foundation

// MARK: - ItemAPIResponseModel
class ItemAPIResponseModel: Codable {
    let id, title: String
    let sellerID: Int
    let categoryID: String
    let price: Double
    let initialQuantity, availableQuantity, soldQuantity: Int
    let condition: String
    let permalink: String
    let thumbnail: String
    let secureThumbnail: String
    let pictures: [Picture]
    let descriptions: [Description]
    let acceptsMercadopago: Bool
    let status: String
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case sellerID = "seller_id"
        case categoryID = "category_id"
        case price
        case initialQuantity = "initial_quantity"
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case condition, permalink, thumbnail
        case secureThumbnail = "secure_thumbnail"
        case pictures
        case descriptions
        case acceptsMercadopago = "accepts_mercadopago"
        case status
        
    }
    
    init(id: String, title: String, sellerID: Int, categoryID: String, price: Double,  initialQuantity: Int, availableQuantity: Int, soldQuantity: Int, condition: String, permalink: String, thumbnail: String, secureThumbnail: String, pictures: [Picture], descriptions: [Description], acceptsMercadopago: Bool, status: String) {
        self.id = id
        self.title = title
        self.sellerID = sellerID
        self.categoryID = categoryID
        self.price = price
        self.initialQuantity = initialQuantity
        self.availableQuantity = availableQuantity
        self.soldQuantity = soldQuantity
        self.condition = condition
        self.permalink = permalink
        self.thumbnail = thumbnail
        self.secureThumbnail = secureThumbnail
        self.pictures = pictures
        self.descriptions = descriptions
        self.acceptsMercadopago = acceptsMercadopago
        self.status = status
    }
}


// MARK: - Description
class Description: Codable {
    let id: String
    
    init(id: String) {
        self.id = id
    }
}


// MARK: - Picture
class Picture: Codable {
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


//// MARK: - SellerAddress
//class SellerAddress: Codable {
//    let city, state, country: City
//    let searchLocation: SearchLocation
//    let latitude, longitude: Double
//    let id: Int
//
//    enum CodingKeys: String, CodingKey {
//        case city, state, country
//        case searchLocation = "search_location"
//        case latitude, longitude, id
//    }
//
//    init(city: City, state: City, country: City, searchLocation: SearchLocation, latitude: Double, longitude: Double, id: Int) {
//        self.city = city
//        self.state = state
//        self.country = country
//        self.searchLocation = searchLocation
//        self.latitude = latitude
//        self.longitude = longitude
//        self.id = id
//    }
//}

//// MARK: - Shipping
//class Shipping: Codable {
//    let mode: String
//    let freeMethods: [FreeMethod]
//    let tags: [String]
//    let dimensions: JSONNull?
//    let localPickUp, freeShipping: Bool
//    let logisticType: String
//    let storePickUp: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case mode
//        case freeMethods = "free_methods"
//        case tags, dimensions
//        case localPickUp = "local_pick_up"
//        case freeShipping = "free_shipping"
//        case logisticType = "logistic_type"
//        case storePickUp = "store_pick_up"
//    }
//
//    init(mode: String, freeMethods: [FreeMethod], tags: [String], dimensions: JSONNull?, localPickUp: Bool, freeShipping: Bool, logisticType: String, storePickUp: Bool) {
//        self.mode = mode
//        self.freeMethods = freeMethods
//        self.tags = tags
//        self.dimensions = dimensions
//        self.localPickUp = localPickUp
//        self.freeShipping = freeShipping
//        self.logisticType = logisticType
//        self.storePickUp = storePickUp
//    }
//}




