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
    @available(*, deprecated, message: "Use combine newest version of performRequest<T>")
    func performRequest<T>(apiURL: URL, completionHandler: @escaping (T?, NetworkError?) -> Void) where T: Decodable, T: Encodable
    
    func performRequest<T: Decodable>(endpoint: Endpoint) -> AnyPublisher<T, NetworkError>
}

class NetworkServiceManager: ServiceManagerProtocol {
    
    func performRequest<T>(apiURL: URL, completionHandler: @escaping (T?, NetworkError?) -> Void) where T: Decodable, T: Encodable {
        
        let sharedSession = URLSession.shared
        
        sharedSession.dataTask(with: apiURL) { data, response, error in
            if let data = data {
                do {
                    let resp = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(resp, nil)
                } catch {
                    completionHandler(nil, .someError)
                }
            }
            }.resume()
    }
    
    func performRequest<T: Decodable>(endpoint: Endpoint) -> AnyPublisher<T, NetworkError> {
        let sharedSession = URLSession.shared
        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = TimeInterval(endpoint.timeout)
        
        guard let _ = endpoint.path.url else {
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
