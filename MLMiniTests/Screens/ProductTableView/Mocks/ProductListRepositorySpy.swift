//
//  ProductListRepositoryStub.swift
//  MLMiniTests
//
//  Created by Alexis Garcia on 14/03/2021.
//  Copyright © 2021 ale. All rights reserved.
//

import Combine
import Foundation
@testable import MLMini

class ProductListRepositorySpy: ProductListRepositoryProtocol, Mock {
    var stubbedApiResponseModel: ProductListInfraestructureModel?
    var stubbedErrorType: NetworkError = .invalidUrl
    var didCallGetProductListData = MockCounter()
    var itemName: String?
    
    func getProductListData(productName: String) -> AnyPublisher<ProductListInfraestructureModel, NetworkError> {
        didCallGetProductListData.wasCalled()
        itemName = productName
        guard let apiResponseModel = stubbedApiResponseModel else {
            return AnyPublisher(Fail<ProductListInfraestructureModel, NetworkError>(error: stubbedErrorType))
        }
        return Future { promise in
            promise(.success(apiResponseModel))
        }.eraseToAnyPublisher()
    }
}
