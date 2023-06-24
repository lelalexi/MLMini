//
//  ProductDetailRepository.swift
//  MLMini
//
//  Created by Alexis Garcia on 16/09/2020.
//  Copyright © 2020 ale. All rights reserved.
//

import Combine
import Foundation

protocol ProductDetailRepositoryProtocol {
    func getItemDescription(itemId: String) -> AnyPublisher<ItemDetailInfraestructureModel, NetworkError>
}

class ProductDetailRepository: ProductDetailRepositoryProtocol {
    private struct Constants {
        static let ML_MLA_DETAIL_PRODUCT_PATH = "/items/"
    }

    private let service: ServiceManagerProtocol
    
    required init(_ service: ServiceManagerProtocol){
        self.service = service
    }
    
    func getItemDescription(itemId: String) -> AnyPublisher<ItemDetailInfraestructureModel, NetworkError> {
        let endpoint = MLEndpoint(path: MLPath(path: Constants.ML_MLA_DETAIL_PRODUCT_PATH + itemId, parameters: [:]))
        return service.performRequest(endpoint: endpoint)
    }
}
