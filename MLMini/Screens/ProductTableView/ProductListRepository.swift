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
    private struct Constants {
        static let ML_MLA_PRODUCT_PATH = "/sites/MLA/search"
        static let ML_QUERY_PARAM = "q"
    }
    
    // MARK: - Properties
    private let service: ServiceManagerProtocol
    
    required init(_ service: ServiceManagerProtocol){
        self.service = service
    }
    
    func getProductListData(productName: String) -> AnyPublisher<APIResponseModel, NetworkError> {
        let parameters = [Constants.ML_QUERY_PARAM: productName]
        let endpoint = MLEndpoint(path: MLPath(path: Constants.ML_MLA_PRODUCT_PATH, parameters: parameters))
        return service.performRequest(endpoint: endpoint)
    }
}
