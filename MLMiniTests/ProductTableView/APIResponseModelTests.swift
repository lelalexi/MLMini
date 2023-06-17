//
//  APIResponseModelTests.swift
//  MLMiniTests
//
//  Created by Alexis Garcia on 14/03/2021.
//  Copyright © 2021 ale. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import MLMini

class APIResponseModelTests: QuickSpec {
    override func spec() {
        describe("APIResponseModelTests") {
            guard let parsedModel = ProductListRepositoryMock.createResponseFrom(json: "ProductListModel") else {
                fail()
                return
            }
            context("Json Serialization") {
                it("Should parse correctly") {
                    await expect(parsedModel.query).to(equal("auriculares"))
                    await expect(parsedModel.paging).notTo(beNil())
                    await expect(parsedModel.results.count).to(equal(3))
                    //TODO: To be completed (should match every json value with parsedModel)
                }
            }
            
            context("Model func tests") {
                it("Should test isEmpty with empty model") {
                    let parsedModel = ApiResponseModelMock.resolveModel(testCase: .emptyResults)
                    expect(parsedModel.isEmpty).to(beTrue())
                }
                it("Should test isEmpty when model is not empty") {
                    let parsedModel = ApiResponseModelMock.resolveModel(testCase: .normal)
                    expect(parsedModel.isEmpty).to(beFalse())
                }
                it("Should test itemAt when model is empty and return an emptyItem") {
                    let parsedModel = ApiResponseModelMock.resolveModel(testCase: .emptyResults)
                    let item = parsedModel.itemAt(index: 2)
                    await expect(item.id).to(equal(""))
                    await expect(item.price).to(equal(0))
                    await expect(item.title).to(equal(""))
                    await expect(item.freeShipping).to(beFalse())
                    await expect(item.thumbnail).to(equal(MLMiniConstants.Images.PLACEHOLDER_ICON))
                }
                it("Should test itemAt with a fully initialized model and return the item") {
                    let itemIndex: Int = 2
                    let item = parsedModel.itemAt(index: itemIndex)
                    guard let freeShipping = parsedModel.results[itemIndex].shipping?.freeShipping else {
                        fail()
                        return
                    }
                    await expect(item.id).to(equal(parsedModel.results[itemIndex].id))
                    await expect(item.price).to(equal(parsedModel.results[itemIndex].price))
                    await expect(item.title).to(equal(parsedModel.results[itemIndex].title))
                    await expect(item.freeShipping).to(equal(freeShipping))
                    await expect(item.thumbnail).to(equal(parsedModel.results[itemIndex].thumbnail))
                }
                
            }
        }
    }
}
