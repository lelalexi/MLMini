//
//  ProductListBuilder.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 16/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import UIKit

struct ProductListBuilder {
    func getView(forItemToSearch product: String, coordinator: ProductDetailCoordinatorProtocol?) -> UIViewController {
        let service = NetworkServiceManager()
        let repository = ProductListRepository(service)
        
        let presenter = ProductListPresenter(repository: repository, productToSearch: product, coordinator: coordinator)
        let view = ProductListViewController(presenter: presenter)
        presenter.view = view
        return view
    }
}
