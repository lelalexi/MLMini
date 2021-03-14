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
            context("Init Test") {
                it("Presenter init Should initialize correctly") {
                    let view = ProductListViewProtocolMock()
                    let repository = ProductListRepositoryStub(ServiceManager())
                    let presenter = ProductListPresenter(repository: repository)
                    presenter.view = view
                    presenter.viewDidLoad()
                    
                    expect(presenter.repository).to(be(repository))
                    expect(presenter.model).to(beNil())
                    MockSwift.verify(view.didCallShowSpinner)
                    MockSwift.verify(view)
                }
            }
            context("Screen Test cases") {
                it("should get SUCCESS data from repository and fill the list") {
                    let view = ProductListViewProtocolMock()
                    let repository = ProductListRepositoryStub(ServiceManager())
                    repository.apiResponseModel = ApiResponseModelMock.resolveModel()
                    let presenter = ProductListPresenter(repository: repository)
                    presenter.view = view
                    presenter.onSearchTextSetted(toSearch: "something")
                    
                    MockSwift.verify(repository.didCallGeetProductListData)
                    MockSwift.verify(repository)
                    
                    //This tasks runs asynchronously
                    waitUntil(timeout: DispatchTimeInterval.milliseconds(20)) { done in
                        MockSwift.verify(view.didCallRemoveSpinner)
                        MockSwift.verify(view.didCallFillList)
                        MockSwift.verify(view, wasCalledTimes: 2)
                        expect(presenter.model).notTo(beNil())
                        done()
                    }
                }
                
                it("should get SUCCESS empty data from repository and show showEmptyView") {
                    let view = ProductListViewProtocolMock()
                    let repository = ProductListRepositoryStub(ServiceManager())
                    repository.apiResponseModel = ApiResponseModelMock.resolveModel(testCase: .emptyResults)
                    let presenter = ProductListPresenter(repository: repository)
                    presenter.view = view
                    presenter.onSearchTextSetted(toSearch: "something")
                    
                    MockSwift.verify(repository.didCallGeetProductListData)
                    MockSwift.verify(repository)
                    
                    //This tasks runs asynchronously
                    waitUntil(timeout: DispatchTimeInterval.milliseconds(20)) { done in
                        MockSwift.verify(view.didCallShowEmptyView)
                        MockSwift.verify(view)
                        done()
                    }
                }
                it("should get ERROR data from repository and show showErrorView") {
                    let view = ProductListViewProtocolMock()
                    let repository = ProductListRepositoryStub(ServiceManager())
                    let presenter = ProductListPresenter(repository: repository)
                    presenter.view = view
                    presenter.onSearchTextSetted(toSearch: "something")
                    
                    MockSwift.verify(repository.didCallGeetProductListData)
                    MockSwift.verify(repository)
                    
                    //This tasks runs asynchronously
                    waitUntil(timeout: DispatchTimeInterval.milliseconds(20)) { done in
                        MockSwift.verify(view.didCallShowErrorView)
                        MockSwift.verify(view)
                        done()
                    }
                }
            }
            context("User interactions cases") {
                it("should go to product detail when user taps an item") {
                    let view = ProductListViewProtocolMock()
                    let repository = ProductListRepositoryStub(ServiceManager())
                    let presenter = ProductListPresenter(repository: repository)
                    presenter.view = view
                    presenter.onListItemTapped(itemId: "01")
                    
                    MockSwift.verify(view.didCallGoToDetailScreen)
                    MockSwift.verify(view)
                }
            }
        }
    }
}
