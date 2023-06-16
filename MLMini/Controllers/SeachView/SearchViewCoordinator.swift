//
//  SearchViewCoordinator.swift
//  MLMini
//

import UIKit

protocol SearchViewCoordinatorProtocol: AnyObject {
    func navigateToProductListScreen(itemToSearch: String)
}

class SearchViewCoordinator: SearchViewCoordinatorProtocol {
    private let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func navigateToProductListScreen(itemToSearch item: String) {
        let productListVC = ProductListBuilder().getView(forItemToSearch: item)
        controller.navigationController?.pushViewController(productListVC, animated: true)
    }
}
