//
//  ProductListRepository.swift
//  MLMini
//
//  Created by Alexis Garcia on 14/09/2020.
//  Copyright © 2020 ale. All rights reserved.
//

import Combine
import Foundation
 
protocol ProductListRepositoryProtocol {
    func getProductListData(productName: String) -> AnyPublisher<APIResponseModel, NetworkError>
}

class ProductListRepository: ProductListRepositoryProtocol {
    
    // MARK: - Properties
    private let service: ServiceManagerProtocol
    
    required init(_ service: ServiceManagerProtocol){
        self.service = service
    }
    
    func getProductListData(productName: String) -> AnyPublisher<APIResponseModel, NetworkError> {
        let parameters = [MLMiniConstants.API.ML_QUERY_PARAM: productName]
        let endpoint = MLEndpoint(path: MLPath(path: MLMiniConstants.API.ML_MLA_PRODUCT_PATH, parameters: parameters))
        return service.performRequest(endpoint: endpoint)
    }
}
