//
//  MLGenericFeedbackScreenFactory.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 15/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import Foundation

struct MLGenericFeedbackModelFactory {
    func resolveFeedbackModel(forCase _case: MLGenericFeedbackScreenComponent.FeedbackCase) -> MLGenericFeedbackModel {
        switch _case {
        case .miscError:
            return createMiscErrorScreenModel()
        case .itemNotFound:
            return createItemNotFoundScreenModel()
        }
    }
    
    private func createMiscErrorScreenModel() -> MLGenericFeedbackModel {
        MLGenericFeedbackModel(image: MLImage.damagedPackage,
                               title: "Oops!",
                               subtitle: "Something went wrong, try again later or in a couple of minutes.",
                               ctaTitle: "Retry")
    }
    
    private func createItemNotFoundScreenModel() -> MLGenericFeedbackModel {
        MLGenericFeedbackModel(image: MLImage.attentionMagnifierglasses,
                               title: "We could not find any match for your search",
                               subtitle: "Check if your search is corect and try again, You can also try with less or more general words.",
                               ctaTitle: "Go Back")
    }
}
