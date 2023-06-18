//
//  MLMiniMainCoordinatorTests.swift
//  MLMiniTests
//
//  Created by Alexis Garcia Carli on 18/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import Quick
import Nimble
@testable import MLMini

class MLMiniMainCoordinatorTests: QuickSpec {
    override func spec() {
        describe("ProductListCoordinatorTests") {
            
            var navControllerSpy: NavigationControllerSpy!
            var SUT: MLMiniMainCoordinator!
            
            beforeEach {
                navControllerSpy = NavigationControllerSpy()
                SUT = MLMiniMainCoordinator(navController: navControllerSpy)
            }
            
            context("Navigate to Product Seach View Tests") {
                it("Should push ProductSearh VC") {
                    // When
                    DispatchQueue.main.sync { [weak SUT] in
                        SUT?.navigateToSearchView()
                    }
                    // Then
                    MockSwift.verify(navControllerSpy)
                    await expect(await navControllerSpy.pushViewControllerParams?.viewController).to(beAKindOf(SearchViewControllerSwiftUIBridge.self))
                }
            }
            
            context("Navigate to Product List Tests") {
                it("Should push ProductList VC") {
                    // Given
                    let itemToSearch = "Some Item to search"
                    // When
                    DispatchQueue.main.sync { [weak SUT] in
                        SUT?.navigateToProductList(itemToSearch: itemToSearch)
                    }
                    // Then
                    MockSwift.verify(navControllerSpy)
                    await expect(await navControllerSpy.pushViewControllerParams?.viewController).to(beAKindOf(ProductListViewController.self))
                }
            }
            
            context("Navigate to Product Detail Tests") {
                it("Should push ProductDetail VC") {
                    // Given
                    let itemID = "Some Item ID"
                    // When
                    DispatchQueue.main.sync { [weak SUT] in
                        SUT?.navigateToProductDetail(itemId: itemID)
                    }
                    // Then
                    MockSwift.verify(navControllerSpy)
                    await expect(await navControllerSpy.pushViewControllerParams?.viewController).to(beAKindOf(ProductDetailViewController.self))
                }
            }
        }
    }
}
