//
//  ProductListCoordinatorTests.swift
//  MLMiniTests
//
//  Created by Alexis Garcia Carli on 16/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import MLMini

class ProductListCoordinatorTests: QuickSpec {
    override func spec() {
        describe("ProductListCoordinatorTests") {
            let itemID = "Some Item ID"
            var navControllerSpy: navigationControllerSpy!
            var SUT: ProductListCoordinatorProtocol!
            
            beforeEach {
                navControllerSpy = navigationControllerSpy()
                SUT = ProductListCoordinator(navController: navControllerSpy)
            }
            
            context("Navigation Tests") {
                it("Should push ProductDetail VC") {
                    // When
                    DispatchQueue.main.sync { [weak SUT] in
                        SUT?.navigateToItemDetailView(itemID: itemID)
                    }
                    // Then
                    MockSwift.verify(navControllerSpy)
                    await expect(await navControllerSpy.pushViewControllerParams?.viewController).to(beAKindOf(ProductDetailViewController.self))
                }
            }
        }
    }
}

class navigationControllerSpy: UINavigationController, Mock {
    var didCallPushViewController = MockCounter()
    var pushViewControllerParams: (viewController: UIViewController, animated: Bool)?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        didCallPushViewController.wasCalled()
        pushViewControllerParams = (viewController: viewController, animated: animated)
    }
}
