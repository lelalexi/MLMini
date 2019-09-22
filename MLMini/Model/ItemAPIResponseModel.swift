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
    let id, siteID, title: String
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
        case siteID = "site_id"
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
    
    init(id: String, siteID: String, title: String, sellerID: Int, categoryID: String, price: Double,  initialQuantity: Int, availableQuantity: Int, soldQuantity: Int, condition: String, permalink: String, thumbnail: String, secureThumbnail: String, pictures: [Picture], descriptions: [Description], acceptsMercadopago: Bool, status: String) {
        self.id = id
        self.siteID = siteID
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

//// MARK: - Attribute
//class Attribute: Codable {
//    let id, name: String
//    let valueID: String?
//    let valueName: String
//    let valueStruct: JSONNull?
//    let attributeGroupID, attributeGroupName: String
//    
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case valueID = "value_id"
//        case valueName = "value_name"
//        case valueStruct = "value_struct"
//        case attributeGroupID = "attribute_group_id"
//        case attributeGroupName = "attribute_group_name"
//    }
//    
//    init(id: String, name: String, valueID: String?, valueName: String, valueStruct: JSONNull?, attributeGroupID: String, attributeGroupName: String) {
//        self.id = id
//        self.name = name
//        self.valueID = valueID
//        self.valueName = valueName
//        self.valueStruct = valueStruct
//        self.attributeGroupID = attributeGroupID
//        self.attributeGroupName = attributeGroupName
//    }
//}

// MARK: - Description
class Description: Codable {
    let id: String
    
    init(id: String) {
        self.id = id
    }
}

// MARK: - Geolocation
class Geolocation: Codable {
    let latitude, longitude: Double
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

// MARK: - Location
class Location: Codable {
    
    init() {
    }
}

// MARK: - Picture
class Picture: Codable {
    let id: String
    let url: String
    let secureURL: String
    let size, maxSize, quality: String
    
    enum CodingKeys: String, CodingKey {
        case id, url
        case secureURL = "secure_url"
        case size
        case maxSize = "max_size"
        case quality
    }
    
    init(id: String, url: String, secureURL: String, size: String, maxSize: String, quality: String) {
        self.id = id
        self.url = url
        self.secureURL = secureURL
        self.size = size
        self.maxSize = maxSize
        self.quality = quality
    }
}

// MARK: - SaleTerm
class SaleTerm: Codable {
    let id, name: String
    let valueID: String?
    let valueName: String
    let valueStruct: ValueStruct?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case valueID = "value_id"
        case valueName = "value_name"
        case valueStruct = "value_struct"
    }
    
    init(id: String, name: String, valueID: String?, valueName: String, valueStruct: ValueStruct?) {
        self.id = id
        self.name = name
        self.valueID = valueID
        self.valueName = valueName
        self.valueStruct = valueStruct
    }
}

// MARK: - ValueStruct
class ValueStruct: Codable {
    let number: Int
    let unit: String
    
    init(number: Int, unit: String) {
        self.number = number
        self.unit = unit
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

// MARK: - City
class City: Codable {
    let id, name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

// MARK: - SearchLocation
class SearchLocation: Codable {
    let city, state: City
    
    init(city: City, state: City) {
        self.city = city
        self.state = state
    }
}

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

// MARK: - FreeMethod
class FreeMethod: Codable {
    let id: Int
    let rule: Rule
    
    init(id: Int, rule: Rule) {
        self.id = id
        self.rule = rule
    }
}

// MARK: - Rule
class Rule: Codable {
    let ruleDefault: Bool
    let freeMode: String
    let freeShippingFlag: Bool
    let value: JSONNull?
    
    enum CodingKeys: String, CodingKey {
        case ruleDefault = "default"
        case freeMode = "free_mode"
        case freeShippingFlag = "free_shipping_flag"
        case value
    }
    
    init(ruleDefault: Bool, freeMode: String, freeShippingFlag: Bool, value: JSONNull?) {
        self.ruleDefault = ruleDefault
        self.freeMode = freeMode
        self.freeShippingFlag = freeShippingFlag
        self.value = value
    }
}

// MARK: - Variation
class Variation: Codable {
    let id, price: Int
    let attributeCombinations: [SaleTerm]
    let availableQuantity, soldQuantity: Int
    let saleTerms: [JSONAny]
    let pictureIDS: [String]
    let catalogProductID: String
    
    enum CodingKeys: String, CodingKey {
        case id, price
        case attributeCombinations = "attribute_combinations"
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case saleTerms = "sale_terms"
        case pictureIDS = "picture_ids"
        case catalogProductID = "catalog_product_id"
    }
    
    init(id: Int, price: Int, attributeCombinations: [SaleTerm], availableQuantity: Int, soldQuantity: Int, saleTerms: [JSONAny], pictureIDS: [String], catalogProductID: String) {
        self.id = id
        self.price = price
        self.attributeCombinations = attributeCombinations
        self.availableQuantity = availableQuantity
        self.soldQuantity = soldQuantity
        self.saleTerms = saleTerms
        self.pictureIDS = pictureIDS
        self.catalogProductID = catalogProductID
    }
}

