//
//  ProductListPresenterTests.swift
//  MLMiniTests
//
//  Created by Alexis Garcia on 14/03/2021.
//  Copyright © 2021 ale. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import MLMini

class ProductListPresenterTests: QuickSpec {
    override func spec() {
        describe("ProductListPresenterTests") {
            let itemName = "Some Item Name"
            var view: ProductListViewProtocolMock!
            var repository: ProductListRepositorySpy!
            var SUT: ProductListPresenter!
            
            beforeEach {
                view = ProductListViewProtocolMock()
                repository = ProductListRepositorySpy()
                SUT = ProductListPresenter(repository: repository, productToSearch: itemName)
                SUT.view = view
            }
            
            context("Screen Test cases") {
                it("should get SUCCESS data from repository and fill the list") {
                    // Given
                    repository.stubbedApiResponseModel = ApiResponseModelMock.resolveModel()
                    // When
                    SUT.viewDidLoad()
                    // Then
                    await verifySuccessDataLoad()
                }
                
                it("should get SUCCESS empty data from repository and show showEmptyView") {
                    // Given
                    repository.stubbedApiResponseModel = ApiResponseModelMock.resolveModel(testCase: .emptyResults)
                    // When
                    SUT.viewDidLoad()
                    // Then
                    verifyRepositoryBeingCalled()
                    await waitUntil(timeout: DispatchTimeInterval.milliseconds(20)) { done in
                        MockSwift.verify(view.didCallShowEmptyView)
                        MockSwift.verify(view, wasCalledTimes: 3)
                        done()
                    }
                }
                it("should get ERROR data from repository and show showErrorView") {
                    // When
                    SUT.viewDidLoad()
                    // Then
                    verifyRepositoryBeingCalled()
                    await waitUntil(timeout: DispatchTimeInterval.milliseconds(20)) { done in
                        MockSwift.verify(view.didCallShowErrorView)
                        MockSwift.verify(view, wasCalledTimes: 3)
                        done()
                    }
                }
                it("should GET data again when retrying") {
                    // Given
                    repository.stubbedApiResponseModel = ApiResponseModelMock.resolveModel()
                    // When
                    SUT.onErrorScreenRetryTapped()
                    // Then
                    await verifySuccessDataLoad()
                }
                
                func verifyRepositoryBeingCalled() {
                    expect(repository.itemName).to(equal(itemName))
                    MockSwift.verify(repository.didCallGetProductListData)
                    MockSwift.verify(repository)
                }
                
                func verifySuccessDataLoad() async {
                    verifyRepositoryBeingCalled()
                    
                    //This tasks runs asynchronously
                    await waitUntil(timeout: DispatchTimeInterval.milliseconds(20)) { done in
                        MockSwift.verify(view.didCallRemoveSpinner)
                        MockSwift.verify(view.didCallFillList)
                        MockSwift.verify(view, wasCalledTimes: 3)
                        done()
                    }
                }
            }
            context("User interactions cases") {
                it("should go to product detail when user taps an item") {
                    // Given
                    let coordinator = ProductListCoordinatorSpy()
                    SUT.coordinator = coordinator
                    let itemID = "Some ID"
                    // When
                    SUT.onListItemTapped(itemId: itemID)
                    // Then
                    expect(coordinator.itemIDParam).to(equal(itemID))
                    MockSwift.verify(coordinator.didCallNavigateToItemDetailView)
                    MockSwift.verify(coordinator)
                }
            }
        }
    }
}
