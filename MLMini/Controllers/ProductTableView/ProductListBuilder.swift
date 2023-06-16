//
//  ProductListBuilder.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 16/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import UIKit

struct ProductListBuilder {
    func getView(forProductToSearch product: String) -> UIViewController {
        let service = NetworkServiceManager()
        let repository = ProductListRepository(service)
        let presenter = ProductListPresenter(repository: repository, productToSearch: product)
        #warning("Add presenter to vc init")
        let view = ProductListViewController()
        return view
    }
}
