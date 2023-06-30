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
    func getUserData(userId: Int) -> AnyPublisher<MLUserInformationInfraestructureModel, NetworkError>
}

class ProductDetailRepository: ProductDetailRepositoryProtocol {
    private struct Constants {
        static let ML_DETAIL_PRODUCT_PATH = "/items/"
        static let ML_DESCRIPTION_PRODUCT_PATH = "/description"
        static let ML_USER_INFORMATION_PATH = "/users/"
    }

    private let service: ServiceManagerProtocol
    
    required init(_ service: ServiceManagerProtocol){
        self.service = service
    }
    
    func getItemDetail(itemId: String) -> AnyPublisher<ItemDetailInfraestructureModel, NetworkError> {
        let endpoint = MLEndpoint(path: MLPath(path: Constants.ML_DETAIL_PRODUCT_PATH + itemId, parameters: [:]))
        return service.performRequest(endpoint: endpoint)
    }
    
    func getItemDescription(itemId: String) -> AnyPublisher<ItemDescriptionInfraestructureModel, NetworkError> {
        let endpoint = MLEndpoint(path: MLPath(path: Constants.ML_DETAIL_PRODUCT_PATH + itemId + Constants.ML_DESCRIPTION_PRODUCT_PATH, parameters: [:]))
        return service.performRequest(endpoint: endpoint)
    }
    
    func getUserData(userId: Int) -> AnyPublisher<MLUserInformationInfraestructureModel, NetworkError> {
        let endpoint = MLEndpoint(path: MLPath(path: Constants.ML_USER_INFORMATION_PATH + String(userId), parameters: [:]))
        return service.performRequest(endpoint: endpoint)
    }
}
