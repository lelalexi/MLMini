//
//  MLEnvironment.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 16/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import Foundation

public enum MLEnvironment: String, CaseIterable {
    case staging
    case production
}

extension MLEnvironment {
    private struct API {
        static let ML_PRODUCTION_BASE_URL = "https://api.mercadolibre.com"
        static let ML_STAGING_BASE_URL = "" //To Be Defined
    }

    var baseURL: String {
        switch self {
        case .staging:
            return API.ML_STAGING_BASE_URL
        case .production:
            return API.ML_PRODUCTION_BASE_URL
        }
    }
}
