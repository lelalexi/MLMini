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
    func getItemDetail(itemId: String) -> AnyPublisher<ItemDetailInfraestructureModel, NetworkError>
    func getItemDescription(itemId: String) -> AnyPublisher<ItemDescriptionInfraestructureModel, NetworkError>
}

class ProductDetailRepository: ProductDetailRepositoryProtocol {
    private struct Constants {
        static let ML_MLA_DETAIL_PRODUCT_PATH = "/items/"
        static let ML_MLA_DESCRIPTION_PRODUCT_PATH = "/description"
    }

    private let service: ServiceManagerProtocol
    
    required init(_ service: ServiceManagerProtocol){
        self.service = service
    }
    
    func getItemDetail(itemId: String) -> AnyPublisher<ItemDetailInfraestructureModel, NetworkError> {
        let endpoint = MLEndpoint(path: MLPath(path: Constants.ML_MLA_DETAIL_PRODUCT_PATH + itemId, parameters: [:]))
        return service.performRequest(endpoint: endpoint)
    }
    
    func getItemDescription(itemId: String) -> AnyPublisher<ItemDescriptionInfraestructureModel, NetworkError> {
        let endpoint = MLEndpoint(path: MLPath(path: Constants.ML_MLA_DETAIL_PRODUCT_PATH + itemId + Constants.ML_MLA_DESCRIPTION_PRODUCT_PATH, parameters: [:]))
        return service.performRequest(endpoint: endpoint)
    }
}
