//
//  MLLocalizables.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 21/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import Foundation

struct MLLocalizables {
    struct SearchView {
        static var buttonTitle: String { "SearchScreenMainButton".localized() }
        static var searchTextFieldHint: String { "SearchScreenTextFieldHint".localized() }
    }
    
    struct ProductListView {
        static var freeShippingLabel: String { "FreeShippingLabel".localized() }
    }
    
    struct ProductDetailView {
        static var soldItemsLabel: String { "SoldItemsLabel".localized() }
        static var soldByItemsLabel: String { "SoldByItemsLabel".localized() }
    }
    
    struct ComponentFeedbackView {
        // Not Found
        static var notFoundTitle: String { "FeedbackNotFoundTitle".localized() }
        static var notFoundSubtitle: String { "FeedbackNotFoundSubtitle".localized() }
        static var notFoundButtonTitle: String { "FeedbackNotFoundButton".localized() }
        // Error
        static var errorTitle: String { "FeedbackErrorTitle".localized() }
        static var errorSubtitle: String { "FeedbackErrorSubtitle".localized() }
        static var errorButtonTitle: String { "FeedbackErrorButton".localized() }
    }
}
