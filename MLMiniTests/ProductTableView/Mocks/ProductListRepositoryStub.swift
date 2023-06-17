//
//  ProductListRepositoryStub.swift
//  MLMiniTests
//
//  Created by Alexis Garcia on 14/03/2021.
//  Copyright © 2021 ale. All rights reserved.
//

import Foundation
@testable import MLMini

class ProductListRepositoryStub: ProductListRepository, Mock {
    
    var apiResponseModel: APIResponseModel?
    var didCallGeetProductListData = MockCounter()
    
    override func getProductListData(productName: String, completionHandler: @escaping (APIResponseModel?, UrlErrors?) -> Void) {
        didCallGeetProductListData.wasCalled()
        guard let apiResponseModel = apiResponseModel else {
            return completionHandler(nil, UrlErrors.invalidUrl)
        }
        return completionHandler(apiResponseModel, nil)
    }
}
