//
//  Endpoint.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 15/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import Foundation

public protocol Endpoint {
    var path: MLPath { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var body: Data? { get }
    var timeout: Float { get }
}

extension Endpoint {
    func getURLRequest() -> URLRequest {
        var urlRequest = URLRequest(url: path.url!)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = body
        return urlRequest
    }
}

struct MLEndpoint: Endpoint {
    var path: MLPath
    var method: HTTPMethod
    var headers: [String : String]
    var body: Data?
    var timeout: Float
    var environment: MLEnvironment
    
    init(path: MLPath,
         method: HTTPMethod = .GET,
         headers: [String :String] = [:],
         body: Data? = nil,
         timeout: Float = 5,
         environment: MLEnvironment = .production) {
        self.path = path
        self.method = method
        self.headers = headers
        self.body = body
        self.timeout = timeout
        self.environment = environment
    }
}
