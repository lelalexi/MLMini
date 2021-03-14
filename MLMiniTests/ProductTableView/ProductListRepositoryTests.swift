//
//  ProductListRepositoryTests.swift
//  MLMiniTests
//
//  Created by Alexis Garcia on 14/03/2021.
//  Copyright © 2021 ale. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import MLMini

//TODO: Test repository error cases after error management is done

class ProductListRepositoryTests: QuickSpec {
    override func spec() {
        describe("ProductListRepositoryTests") {
            context("PerformReques test") {
                it("Should retreive data correctly") {
                    let mockedService = ServiceManagerMock<APIResponseModel>()
                    mockedService.errorType = nil
                    mockedService.requestResponse = ApiResponseModelMock.resolveModel()
                    
                    let repository = ProductListRepository(mockedService)
                    repository.getProductListData(productName: "auriculares") { (model, error) in
                        expect(model).notTo(beNil())
                        expect(error).to(beNil())
                        expect(model).to(equal(mockedService.requestResponse))
                    }
                }
                it("Should retreive error when something has gone wrong") {
                    let mockedService = ServiceManagerMock<APIResponseModel>()
                    mockedService.errorType = .invalidUrl
                    
                    let repository = ProductListRepository(mockedService)
                    repository.getProductListData(productName: "auriculares") { (model, error) in
                        expect(model).to(beNil())
                        expect(error).notTo(beNil())
                        expect(error).to(equal(UrlErrors.someError))
                    }
                }
            }
        }
    }
}
