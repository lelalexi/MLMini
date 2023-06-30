//
//  ProductDetailViewControllerSwiftUIBridge.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 29/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import SwiftUI
import UIKit

class ProductDetailViewControllerSwiftUIBridge: UIViewController, ObservableObject {
    weak var coordinator: ProductListCoordinatorProtocol?
    private var itemId: String
    
    init(coordinator: ProductListCoordinatorProtocol?,
         itemId: String) {
        self.coordinator = coordinator
        self.itemId = itemId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
    }
    
    func addView() {
        let searchView = ProductDetailBuilder().getSwiftUIView(forItemId: itemId)
        let controller = UIHostingController(rootView: searchView.environmentObject(self))
        addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controller.view)
        controller.didMove(toParent: self)

        NSLayoutConstraint.activate([
            controller.view.widthAnchor.constraint(equalTo: view.widthAnchor),
            controller.view.heightAnchor.constraint(equalTo: view.heightAnchor),
            controller.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            controller.view.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
