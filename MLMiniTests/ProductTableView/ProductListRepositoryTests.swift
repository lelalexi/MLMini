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

class ProductListRepositoryTests: QuickSpec {
    override func spec() {
        describe("ProductListRepositoryTests") {
            var serviceMock: ServiceManagerMock<APIResponseModel>!
            var SUT: ProductListRepository!

            beforeEach {
                serviceMock = ServiceManagerMock<APIResponseModel>()
                serviceMock.errorType = .someError
                SUT = ProductListRepository(serviceMock)
            }
            
            context("PerformRequest test") {
                it("Should retreive data correctly") {
                    serviceMock.requestResponse = ApiResponseModelMock.resolveModel()
                    
                    let expectation = XCTestExpectation()
                    _ = SUT.getProductListData(productName: "headphones")
                        .sink(receiveCompletion: { completion in
                            switch completion {
                            case .failure:
                                XCTFail("Should not return an error")
                            case .finished:
                                break
                            }
                        }, receiveValue: { response in
                            expect(response).to(equal(serviceMock.requestResponse))
                            expectation.fulfill()
                        })
                    self.wait(for: [expectation], timeout: 0.1)
                }
                
                it("Should retreive error when something has gone wrong") {
                    
                    let expectation = XCTestExpectation()
                    _ = SUT.getProductListData(productName: "headphones")
                        .sink(receiveCompletion: { completion in
                            switch completion {
                            case .failure:
                                expectation.fulfill()
                            case .finished:
                                break
                            }
                        }, receiveValue: { response in
                            XCTFail("Should fail")
                        })
                    self.wait(for: [expectation], timeout: 0.1)
                }
            }
        }
    }
}
