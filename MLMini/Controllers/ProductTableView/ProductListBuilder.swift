//
//  ProductListBuilder.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 16/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import UIKit

struct ProductListBuilder {
    func getView(forItemToSearch product: String) -> UIViewController {
        let service = NetworkServiceManager()
        let repository = ProductListRepository(service)
        
        let presenter = ProductListPresenter(repository: repository, productToSearch: product)
        let view = ProductListViewController(presenter: presenter)
        let coordinator = ProductListCoordinator(navController: view.navigationController)
        presenter.view = view
        presenter.coordinator = coordinator
        return view
    }
}
