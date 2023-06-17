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
    private weak var navController: UINavigationController?
    
    init(navController: UINavigationController?) {
        self.navController = navController
    }
    
    func navigateToItemDetailView(itemID: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let productDetailVC = storyboard.instantiateViewController(withIdentifier: "ProductDetailViewControllerID") as! ProductDetailViewController
        productDetailVC.itemId = itemID
        navController?.pushViewController(productDetailVC, animated: true)
    }
}
