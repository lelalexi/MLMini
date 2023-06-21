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
                               title: MLLocalizables.ComponentFeedbackView.errorTitle,
                               subtitle: MLLocalizables.ComponentFeedbackView.errorSubtitle,
                               ctaTitle: MLLocalizables.ComponentFeedbackView.errorButtonTitle)
    }
    
    private func createItemNotFoundScreenModel() -> MLGenericFeedbackModel {
        MLGenericFeedbackModel(image: MLImage.attentionMagnifierglasses,
                               title: MLLocalizables.ComponentFeedbackView.notFoundTitle,
                               subtitle: MLLocalizables.ComponentFeedbackView.notFoundSubtitle,
                               ctaTitle: MLLocalizables.ComponentFeedbackView.notFoundButtonTitle)
    }
}
