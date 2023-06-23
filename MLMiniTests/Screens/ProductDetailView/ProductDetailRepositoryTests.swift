//
//  ProductDetailRepositoryTests.swift
//  MLMiniTests
//
//  Created by Alexis Garcia Carli on 23/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import MLMini

class ProductDetailRepositoryTests: QuickSpec {
    override func spec() {
        describe("ProductDetailRepositoryTests") {
            var serviceMock: ServiceManagerMock<ItemResponseModel>!
            var SUT: ProductDetailRepositoryProtocol!

            beforeEach {
                serviceMock = ServiceManagerMock<ItemResponseModel>()
                serviceMock.errorType = .someError
                SUT = ProductDetailRepository(serviceMock)
            }
            
            context("PerformRequest test") {
                it("Should retreive data correctly") {
                    // Given
                    serviceMock.requestResponse = ItemResponseModelMock.resolveModel()
                    // When
                    let expectation = XCTestExpectation()
                    _ = SUT.getItemDescription(itemId: "headphones")
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
                    // When
                    let expectation = XCTestExpectation()
                    _ = SUT.getItemDescription(itemId: "headphones")
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
