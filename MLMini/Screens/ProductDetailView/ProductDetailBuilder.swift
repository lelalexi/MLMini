//
//  ProductDetailBuilder.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 23/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import Foundation
import UIKit

struct ProductDetailBuilder {
    private struct Constants {
        static let STORYBOARD_NAME = "Main"
        static let STORYBOARD_PRODUCT_DETAIL_VC_XIB_NAME = "ProductDetailViewControllerID"
    }

    func getView(forItemId itemId: String) -> UIViewController {
        let service = NetworkServiceManager()
        let repository = ProductDetailRepository(service)
        let view = loadProductDetailVCFromStoryboard()
        let presenter = ProductDetailPresenter(repository: repository, view: view, itemId: itemId)
        view.presenter = presenter
        return view
    }
    
    private func loadProductDetailVCFromStoryboard() -> ProductDetailViewController {
        let storyboard = UIStoryboard(name: Constants.STORYBOARD_NAME, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: Constants.STORYBOARD_PRODUCT_DETAIL_VC_XIB_NAME) as! ProductDetailViewController
    }
}
