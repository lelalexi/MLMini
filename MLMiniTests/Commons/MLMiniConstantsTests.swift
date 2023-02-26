//
//  MLMiniConstantsTests.swift
//  MLMiniTests
//
//  Created by Alexis Garcia on 14/03/2021.
//  Copyright © 2021 ale. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import MLMini

class MLMiniConstantsTests: QuickSpec {
    override func spec() {
        describe("MLMiniConstantsTests") {
            context("MLMini Constants") {
                it("should test Color constants succesfully") {
                    await expect(MLMiniConstants.Color.ACTIVE_BACKGROUND).to(equal("activeBackground"))
                    await expect(MLMiniConstants.Color.ACTIVE_BLUE).to(equal("activeBlue"))
                    await expect(MLMiniConstants.Color.CLEAR_GREY).to(equal("clearGrey"))
                    await expect(MLMiniConstants.Color.INTERMEDIATE_GREY).to(equal("intermediateGrey"))
                    await expect(MLMiniConstants.Color.SOFT_GREY).to(equal("softGrey"))
                }
                
                it("should test API constants succesfully") {
                    await expect(MLMiniConstants.API.SCHEME).to(equal("https"))
                    await expect(MLMiniConstants.API.ML_HOST).to(equal("api.mercadolibre.com"))
                    await expect(MLMiniConstants.API.ML_QUERY_PARAM).to(equal("q"))
                    await expect(MLMiniConstants.API.ML_MLA_PRODUCT_PATH).to(equal("/sites/MLA/search"))
                    await expect(MLMiniConstants.API.ML_MLA_DETAIL_PRODUCT_PATH).to(equal("/items/"))
                }
                
                it("should test Xibs identifiers constants succesfully") {
                    await expect(MLMiniConstants.Xibs.DETAIL_BUY_TABLE_VIEW_CELL).to(equal("BuyDetailTableViewCell"))
                    await expect(MLMiniConstants.Xibs.DETAIL_MAIN_TABLE_VIEW_CELL).to(equal("MainDetailTableViewCell"))
                    await expect(MLMiniConstants.Xibs.DETAIL_PRODUCT_IMAGE_CELL).to(equal("ProductImageCell"))
                    await expect(MLMiniConstants.Xibs.PRODUCT_VIEW_CELL).to(equal("ProductViewCell"))
                }
                
                it("should test Images constants succesfully") {
                    await expect(MLMiniConstants.Images.PLACEHOLDER_ICON).to(equal("Placeholder"))
                    await expect(MLMiniConstants.Images.SEARCH_ICON).to(equal("Search"))
                }
            }
        }
    }
}
