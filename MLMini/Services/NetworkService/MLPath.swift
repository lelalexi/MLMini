//
//  MLPath.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 16/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import Foundation

public struct MLPath {
    private var baseURL: String
    private var path: String
    private var parameters: [String: String] = [:]
    
    public init(environment: MLEnvironment = .production,
                path: String,
                parameters: [String : String]) {
        self.baseURL = environment.baseURL
        self.path = path
        self.parameters = parameters
    }
    
    public func baseAPIURL(environment: MLEnvironment = .production) -> MLPath {
        var current = self
        current.baseURL = environment.baseURL
        return current
    }
    
    public func path(_ path: String) -> MLPath {
        var current = self
        current.path = path
        return current
    }
    
    public func parameters(_ parameters: [String: String]) -> MLPath {
        var current = self
        current.parameters = parameters
        return current
    }
    
    public var url: URL? {
        guard var components = URLComponents(string: "\(baseURL)\(path)") else {
            return nil
        }
        var queryItems = [URLQueryItem]()
        
        for key in parameters.keys {
            let newQueryItem = URLQueryItem(name: key, value: parameters[key])
            queryItems.append(newQueryItem)
        }
        
        if !queryItems.isEmpty {
            components.queryItems = queryItems
        }
        
        return components.url
    }
}
