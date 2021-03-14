//
//  ServiceManagerMock.swift
//  MLMiniTests
//
//  Created by Alexis Garcia on 14/03/2021.
//  Copyright © 2021 ale. All rights reserved.
//

import Foundation
@testable import MLMini

class ServiceManagerMock<T>: ServiceManagerProtocol {
    
    var requestResponse: T?
    var errorType: UrlErrors?
    
    func performRequest<T>(apiURL: URL, completionHandler: @escaping (T?, UrlErrors?) -> Void) where T : Decodable, T : Encodable {
        if let response = requestResponse as? T {
            completionHandler(response, nil)
        } else {
            completionHandler(nil, errorType)
        }
    }
}
