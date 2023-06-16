//
//  ProductListCoordinator.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 16/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import UIKit

protocol ProductListCoordinatorProtocol: AnyObject {
    func navigateToItemDetailView(itemID: String)
}

class ProductListCoordinator: ProductListCoordinatorProtocol {
    private let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func navigateToItemDetailView(itemID: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let productDetailVC = storyboard.instantiateViewController(withIdentifier: "ProductDetailViewControllerID") as! ProductDetailViewController
        productDetailVC.itemId = itemID
        controller.navigationController?.pushViewController(productDetailVC, animated: true)
    }
}
