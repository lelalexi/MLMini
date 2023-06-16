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
    var baseURL: String {
        switch self {
        case .staging:
            return "" //To Be Defined
        case .production:
            return "https://" + MLMiniConstants.API.ML_HOST
        }
    }
}
