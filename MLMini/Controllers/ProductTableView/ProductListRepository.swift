//
//  ProductListRepository.swift
//  MLMini
//
//  Created by Alexis Garcia on 14/09/2020.
//  Copyright © 2020 ale. All rights reserved.
//

import Foundation
 
protocol ProductListRepositoryProtocol {
    func getProductListData(productName: String, completionHandler: @escaping (APIResponseModel?, Error?) -> Void)
}

class ProductListRepository: ProductListRepositoryProtocol {
    
    //MARK: - Properties
    var urlComponents: URLComponents = {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.mercadolibre.com"
        urlComponents.path = "/sites/MLA/search"
        return urlComponents
    }()
    let service: ServiceManagerProtocol?
    
    required init(_ service: ServiceManagerProtocol){
        self.service = service
    }
    
    func getProductListData(productName: String, completionHandler: @escaping (APIResponseModel?, Error?) -> Void) {
        addQueryParam(queryParams: ["q": productName])
        
        if let url = urlComponents.url {
            service?.performRequest(apiURL: url) { (response: APIResponseModel?, error: Error?) -> Void in
                if (error != nil){
                    completionHandler(nil, error)
                } else {
                    completionHandler(response, nil)
                }
            }
        } else {
            completionHandler(nil,UrlErrors.invalidUrl)
        }
    }
    
    private func addQueryParam(queryParams: [String: String]) {
        var queryItems = [URLQueryItem]()
        for queryParam in queryParams {
            let item = URLQueryItem(name: queryParam.key, value: queryParam.value)
            queryItems.append(item)
        }
        urlComponents.queryItems = queryItems
    }
}
