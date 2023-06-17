//
//  ProductListBuilderTests.swift
//  MLMiniTests
//
//  Created by Alexis Garcia Carli on 16/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import MLMini

class ProductListBuilderTests: QuickSpec {
    override func spec() {
        describe("ProductListBuilderTests") {
            let itemToSeach = "Some Item"
            var SUT: ProductListBuilder!
            
            beforeEach {
                SUT = ProductListBuilder()
            }
            
            context("View Building Tests") {
                it("Should obtain a VC of type ProductListViewController") {
                    // When
                    let VC = SUT.getView(forItemToSearch: itemToSeach)
                    // Then
                    await expect(VC).to(beAKindOf(ProductListViewController.self))
                }
            }
        }
    }
}
