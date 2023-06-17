//
//  ProductListViewProtocolMock.swift
//  MLMiniTests
//
//  Created by Alexis Garcia on 14/03/2021.
//  Copyright © 2021 ale. All rights reserved.
//

import Foundation
@testable import MLMini

class ProductListViewProtocolMock: ProductListViewControllerProtocol, Mock {
    
    var didCallShowSpinner = MockCounter()
    var didCallRemoveSpinner = MockCounter()
    var didCallShowEmptyView = MockCounter()
    var didCallReloadView = MockCounter()
    var didCallFillList = MockCounter()
    var didCallShowErrorView = MockCounter()
    
    func showSpinnerView() {
        didCallShowSpinner.wasCalled()
    }
    
    func removeSpinnerView() {
        didCallRemoveSpinner.wasCalled()
    }
    
    func showEmptyView() {
        didCallShowEmptyView.wasCalled()
    }
    
    func showErrorView() {
        didCallShowErrorView.wasCalled()
    }
    
    func reloadView() {
        didCallReloadView.wasCalled()
    }
    
    func fillList(model: APIResponseModel) {
        didCallFillList.wasCalled()
    }
}
