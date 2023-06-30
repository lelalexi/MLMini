//
//  MLMiniMainCoordinator.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 18/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import UIKit

protocol SearchViewCoordinatorProtocol: AnyObject {
    func navigateToSearchView()
}

protocol ProductListCoordinatorProtocol: AnyObject {
    func navigateToProductList(itemToSearch item: String)
}

protocol ProductDetailCoordinatorProtocol: AnyObject {
    func navigateToProductDetail(itemId: String)
}

protocol Coordinator: AnyObject {
    var navController: UINavigationController { get }
    
    func start()
}

class MLMiniMainCoordinator: Coordinator,
                             SearchViewCoordinatorProtocol,
                             ProductListCoordinatorProtocol,
                             ProductDetailCoordinatorProtocol {
    var navController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navController = navController
    }

    func start() {
        navigateToSearchView()
    }
    
    func navigateToSearchView() {
        let searchVC = SearchViewControllerSwiftUIBridge(coordinator: self)
        navController.pushViewController(searchVC, animated: false)
    }
    
    func navigateToProductList(itemToSearch item: String) {
        let productListVC = ProductListBuilder().getView(forItemToSearch: item, coordinator: self)
        navController.pushViewController(productListVC, animated: true)
    }
    
    func navigateToProductDetail(itemId: String) {
        //let productDetailVC = ProductDetailBuilder().getView(forItemId: itemId)
        let productDetailVC = ProductDetailViewControllerSwiftUIBridge(coordinator: self, itemId: itemId)
        navController.pushViewController(productDetailVC, animated: true)
    }
}
