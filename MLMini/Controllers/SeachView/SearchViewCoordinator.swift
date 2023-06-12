//
//  SearchViewCoordinator.swift
//  MLMini
//

import UIKit

protocol SearchViewCoordinatorProtocol: AnyObject {
    func navigateToProductListScreen(textToSearch: String)
}

class SearchViewCoordinator: SearchViewCoordinatorProtocol {
    private let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func navigateToProductListScreen(textToSearch: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let productListVC = storyboard.instantiateViewController(withIdentifier: "ProductListViewControllerID") as! ProductListViewController
        productListVC.toSearch = textToSearch
        controller.navigationController?.pushViewController(productListVC, animated: true)
    }
}
