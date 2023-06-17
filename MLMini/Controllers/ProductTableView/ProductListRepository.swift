//
//  ProductListRepository.swift
//  MLMini
//
//  Created by Alexis Garcia on 14/09/2020.
//  Copyright © 2020 ale. All rights reserved.
//

import Foundation
 
protocol ProductListRepositoryProtocol {
    func getProductListData(productName: String, completionHandler: @escaping (APIResponseModel?, UrlErrors?) -> Void)
}

class ProductListRepository: ProductListRepositoryProtocol {
    
    //MARK: - Properties
    var urlComponents: URLComponents = {
        var urlComponents = URLComponents()
        urlComponents.scheme = MLMiniConstants.API.SCHEME
        urlComponents.host = MLMiniConstants.API.ML_HOST
        urlComponents.path = MLMiniConstants.API.ML_MLA_PRODUCT_PATH
        return urlComponents
    }()
    let service: ServiceManagerProtocol?
    
    required init(_ service: ServiceManagerProtocol){
        self.service = service
    }
    
    func getProductListData(productName: String, completionHandler: @escaping (APIResponseModel?, UrlErrors?) -> Void) {
        addQueryParam(queryParams: [MLMiniConstants.API.ML_QUERY_PARAM: productName])
        
        if let url = urlComponents.url {
            service?.performRequest(apiURL: url) { (response: APIResponseModel?, error: UrlErrors?) -> Void in
                if (error != nil){
                    completionHandler(nil, .someError)
                } else {
                    completionHandler(response, nil)
                }
            }
        } else {
            completionHandler(nil, .invalidUrl)
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
