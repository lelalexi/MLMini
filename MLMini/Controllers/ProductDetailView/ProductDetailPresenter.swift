//
//  ProductDetailPresenter.swift
//  MLMini
//
//  Created by Alexis Garcia on 16/09/2020.
//  Copyright © 2020 ale. All rights reserved.
//

import Foundation

protocol ProductDetailPresenterProtocol {
    
    var view: ProductDetailViewControllerProtocol? { get set }
    func viewDidLoad()
    func onItemIdSetted(itemId: String)
}

class ProductDetailPresenter: ProductDetailPresenterProtocol {
    
    //MARK: - Properties
    weak var view: ProductDetailViewControllerProtocol?
    let repository: ProductDetailRepositoryProtocol?
    var model: ItemDescriptionModel?
    
    //MARK: - Initializers
    required init(repository: ProductDetailRepositoryProtocol) {
        self.repository = repository
    }
    
    func viewDidLoad() {
        
    }
    
    func onItemIdSetted(itemId: String) {
        getItemDescription(itemId: itemId)
    }
    
    func onGetDataSuccess(model: ItemDescriptionModel) {
        view?.updateModelAndReloadData(model: model)
        self.model = model
    }
    
    func onGetDataError() {
        //                TODO: DO SOMETHING WITH THE ERROR
        print("Error in getItemDescription")
    }
    
    private func getItemDescription(itemId: String) {
        repository?.getItemDescription(itemId: itemId, completionHandler: { [weak self] (Response, error) in
            if let _ = error {
                self?.onGetDataError()
            }
            guard let response = Response else { return }
            DispatchQueue.main.async {
                self?.onGetDataSuccess(model: response)
            }
        })
    }
    
}
