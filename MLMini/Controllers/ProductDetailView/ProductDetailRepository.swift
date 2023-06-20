//
//  ProductDetailRepository.swift
//  MLMini
//
//  Created by Alexis Garcia on 16/09/2020.
//  Copyright © 2020 ale. All rights reserved.
//

import Foundation

protocol ProductDetailRepositoryProtocol {
    func getItemDescription(itemId: String, completionHandler: @escaping (ItemDescriptionModel?, Error?) -> Void)
}

class ProductDetailRepository: ProductDetailRepositoryProtocol {
    
    //MARK: - Properties
    var urlComponents: URLComponents = {
        var urlComponents = URLComponents()
        urlComponents.scheme = MLMiniConstants.API.SCHEME
        urlComponents.host = MLMiniConstants.API.ML_HOST
        urlComponents.path = MLMiniConstants.API.ML_MLA_DETAIL_PRODUCT_PATH
        return urlComponents
    }()
    let service: ServiceManagerProtocol?
    
    required init(_ service: ServiceManagerProtocol){
        self.service = service
    }
    
    func getItemDescription(itemId: String, completionHandler: @escaping (ItemDescriptionModel?, Error?) -> Void) {
        urlComponents.path = "\(MLMiniConstants.API.ML_MLA_DETAIL_PRODUCT_PATH)\(itemId)"
        
        if let url = urlComponents.url {
            service?.performRequest(apiURL: url) { (response: ItemResponseModel?, error: Error?) -> Void in
                if (error != nil){
                    completionHandler(nil, error)
                } else {
                    completionHandler(response?.toModel(), nil)
                }
            }
        } else {
            completionHandler(nil,NetworkError.invalidUrl)
        }
    }
}
