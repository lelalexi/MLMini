//
//  MLMiniConstants.swift
//  MLMini
//
//  Created by Alexis Garcia on 13/03/2021.
//  Copyright © 2021 ale. All rights reserved.
//

import Foundation

struct MLMiniConstants {
    struct Color {
        static let ACTIVE_BLUE = "activeBlue"
        static let ACTIVE_BACKGROUND = "activeBackground"
        static let SOFT_GREY = "softGrey"
        static let CLEAR_GREY = "clearGrey"
        static let INTERMEDIATE_GREY = "intermediateGrey"
    }
    struct Images {
        static let SEARCH_ICON = "Search"
        static let PLACEHOLDER_ICON = "Placeholder"
    }
    struct Xibs {
        static let PRODUCT_VIEW_CELL = "ProductViewCell"
        static let DETAIL_MAIN_TABLE_VIEW_CELL = "MainDetailTableViewCell"
        static let DETAIL_BUY_TABLE_VIEW_CELL = "BuyDetailTableViewCell"
        static let DETAIL_PRODUCT_IMAGE_CELL = "ProductImageCell"
    }
    struct API {
        static let SCHEME = "https"
        static let ML_HOST = "api.mercadolibre.com"
        static let ML_MLA_PRODUCT_PATH = "/sites/MLA/search"
        static let ML_MLA_DETAIL_PRODUCT_PATH = "/items/"
        static let ML_QUERY_PARAM = "q"
    }
}
