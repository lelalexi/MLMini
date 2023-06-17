//
//  ProductListRepositoryMock.swift
//  MLMiniTests
//
//  Created by Alexis Garcia on 14/03/2021.
//  Copyright © 2021 ale. All rights reserved.
//

import Foundation
@testable import MLMini

struct ProductListRepositoryMock {
    
    static func createResponseFrom(json nameOfFile: String) -> APIResponseModel? {
        guard let path = Bundle(for: MockSwift.self).path(forResource: nameOfFile, ofType: "json") else { return nil }
        do {
            let json = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            let decoder = JSONDecoder()
            guard let response = try? decoder.decode(APIResponseModel.self, from: json) else { return nil}
            return response
        } catch { return nil }
    }
    
    static func normalApiModel() -> APIResponseModel {
        let paging = Paging(total: 100, offset: 10, limit: 50, primaryResults: 5)
        let results = [
            Result(id: "01",
                   title: "Headset1",
                   price: 43.0,
                   availableQuantity: 5,
                   soldQuantity: 2,
                   stopTime: "23/05/2021",
                   permalink: "https:/something.com",
                   thumbnail: "SampleImage",
                   acceptsMercadopago: true,
                   shipping: Shipping(freeShipping: true),
                   originalPrice: 45.40,
                   officialStoreID: nil,
                   catalogProductID: nil)
        ]
        
        return APIResponseModel(query: "headsets", paging: paging, results: results)
    }
    
    static func emptyResultsApiModel() -> APIResponseModel {
        let paging = Paging(total: 100, offset: 10, limit: 50, primaryResults: 5)
        let results = [Result]()
        return APIResponseModel(query: "headsets", paging: paging, results: results)
    }
}
