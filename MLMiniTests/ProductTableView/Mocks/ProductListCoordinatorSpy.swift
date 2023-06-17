//
//  ProductListCoordinatorSpy.swift
//  MLMiniTests
//
//  Created by Alexis Garcia Carli on 16/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import Foundation
@testable import MLMini

class ProductListCoordinatorSpy: ProductListCoordinatorProtocol, Mock {
    var didCallNavigateToItemDetailView = MockCounter()
    var itemIDParam: String?
    
    func navigateToItemDetailView(itemID: String) {
        didCallNavigateToItemDetailView.wasCalled()
        itemIDParam = itemID
    }
}
