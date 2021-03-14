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
                    expect(MLMiniConstants.Color.ACTIVE_BACKGROUND).to(equal("activeBackground"))
                    expect(MLMiniConstants.Color.ACTIVE_BLUE).to(equal("activeBlue"))
                    expect(MLMiniConstants.Color.CLEAR_GREY).to(equal("clearGrey"))
                    expect(MLMiniConstants.Color.INTERMEDIATE_GREY).to(equal("intermediateGrey"))
                    expect(MLMiniConstants.Color.SOFT_GREY).to(equal("softGrey"))
                }
                
                it("should test API constants succesfully") {
                    expect(MLMiniConstants.API.SCHEME).to(equal("https"))
                    expect(MLMiniConstants.API.ML_HOST).to(equal("api.mercadolibre.com"))
                    expect(MLMiniConstants.API.ML_QUERY_PARAM).to(equal("q"))
                    expect(MLMiniConstants.API.ML_MLA_PRODUCT_PATH).to(equal("/sites/MLA/search"))
                    expect(MLMiniConstants.API.ML_MLA_DETAIL_PRODUCT_PATH).to(equal("/items/"))
                }
                
                it("should test Xibs identifiers constants succesfully") {
                    expect(MLMiniConstants.Xibs.DETAIL_BUY_TABLE_VIEW_CELL).to(equal("BuyDetailTableViewCell"))
                    expect(MLMiniConstants.Xibs.DETAIL_MAIN_TABLE_VIEW_CELL).to(equal("MainDetailTableViewCell"))
                    expect(MLMiniConstants.Xibs.DETAIL_PRODUCT_IMAGE_CELL).to(equal("ProductImageCell"))
                    expect(MLMiniConstants.Xibs.PRODUCT_VIEW_CELL).to(equal("ProductViewCell"))
                }
                
                it("should test Images constants succesfully") {
                    expect(MLMiniConstants.Images.PLACEHOLDER_ICON).to(equal("Placeholder"))
                    expect(MLMiniConstants.Images.SEARCH_ICON).to(equal("Search"))
                }
            }
        }
    }
}
