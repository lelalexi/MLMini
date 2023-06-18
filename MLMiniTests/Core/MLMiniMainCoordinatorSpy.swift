//
//  MLMiniMainCoordinatorSpy.swift
//  MLMiniTests
//
//  Created by Alexis Garcia Carli on 18/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import UIKit
@testable import MLMini

class MLMiniMainCoordinatorSpy: Coordinator,
                                SearchViewCoordinatorProtocol,
                                ProductListCoordinatorProtocol,
                                ProductDetailCoordinatorProtocol,
                                Mock {
    var navController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    var didCallStart = MockCounter()
    
    func start() {
        didCallStart.wasCalled()
    }
    
    var didCallNavigateToSearchView = MockCounter()
    
    func navigateToSearchView() {
        didCallNavigateToSearchView.wasCalled()
    }
    
    var didCallNavigateToProductList = MockCounter()
    var itemToSearch: String?
    
    func navigateToProductList(itemToSearch item: String) {
        didCallNavigateToProductList.wasCalled()
        itemToSearch = item
    }
    
    var didCallNavigateToProductDetail = MockCounter()
    var itemIDParam: String?
    
    func navigateToProductDetail(itemId: String) {
        didCallNavigateToProductDetail.wasCalled()
        itemIDParam = itemId
    }
}
