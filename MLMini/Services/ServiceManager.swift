//
//  ServiceManager.swift
//  MLMini
//
//  Created by Gaston Alexis Garcia Carli on 24/09/2019.
//  Copyright © 2019 ale. All rights reserved.
//

import Foundation

protocol ServiceManagerProtocol {
    
    func performRequest<T>(apiURL: URL, completionHandler: @escaping (T?, Error?) -> Void) where T: Decodable, T: Encodable
}

class ServiceManager: ServiceManagerProtocol {
    
    func performRequest<T>(apiURL: URL, completionHandler: @escaping (T?, Error?) -> Void) where T: Decodable, T: Encodable {
        
        let sharedSession = URLSession.shared
        
        sharedSession.dataTask(with: apiURL) { data, response, error in
            if let data = data {
                do {
                    let resp = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(resp, nil)
                } catch let error {
                    completionHandler(nil, error)
                }
            }
            }.resume()
    }
    
}
