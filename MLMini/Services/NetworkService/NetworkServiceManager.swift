//
//  ServiceManager.swift
//  MLMini
//
//  Created by Gaston Alexis Garcia Carli on 24/09/2019.
//  Copyright © 2019 ale. All rights reserved.
//

import Combine
import Foundation

protocol ServiceManagerProtocol {
    func performRequest<T: Decodable>(endpoint: Endpoint) -> AnyPublisher<T, NetworkError>
}

class NetworkServiceManager: ServiceManagerProtocol {    
    func performRequest<T: Decodable>(endpoint: Endpoint) -> AnyPublisher<T, NetworkError> {
        let sharedSession = URLSession.shared
        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = TimeInterval(endpoint.timeout)
        
        if endpoint.path.url == nil {
            return AnyPublisher(Fail<T, NetworkError>(error: NetworkError.invalidUrl))
        }
        
        return sharedSession
            .dataTaskPublisher(for: endpoint.getURLRequest())
            .tryMap { output in
                guard output.response is HTTPURLResponse else {
                    throw NetworkError.serverError(errorCode: 0, errorDescription: "Server error")
                }
                return output.data
                
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                NetworkError.decodingError(errorDescription: String(describing: error))
            }
            .eraseToAnyPublisher()
    }
}
