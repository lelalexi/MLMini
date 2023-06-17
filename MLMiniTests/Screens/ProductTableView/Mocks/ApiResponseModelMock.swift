//
//  ApiResponseModelMock.swift
//  MLMiniTests
//
//  Created by Alexis Garcia on 14/03/2021.
//  Copyright © 2021 ale. All rights reserved.
//

import Foundation
@testable import MLMini

enum ApiResponseTestCase: String {
    case normal = "normal"
    case emptyResults = "empty_results"
}
struct ApiResponseModelMock {
    static func resolveModel(testCase: ApiResponseTestCase = .normal) -> APIResponseModel {
        switch testCase {
        case .normal:
            return ProductListRepositoryMock.normalApiModel()
        case .emptyResults:
            return ProductListRepositoryMock.emptyResultsApiModel()
        }
    }
}
