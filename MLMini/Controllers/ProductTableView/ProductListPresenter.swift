//
//  ProductListPresenter.swift
//  MLMini
//
//  Created by Alexis Garcia on 14/09/2020.
//  Copyright © 2020 ale. All rights reserved.
//

import Foundation

protocol ProductListPresenterProtocol {
    
    var view: ProductListViewControllerProtocol? { get set }
    func viewDidLoad()
    func onListItemTapped(itemId: String)
    func onSearchTextSetted(toSearch: String)
}

class ProductListPresenter: ProductListPresenterProtocol {    
    
    //MARK: - Properties
    weak var view: ProductListViewControllerProtocol?
    let repository: ProductListRepositoryProtocol?
    var model: APIResponseModel?
    
    //MARK: - Initializers
    required init(repository: ProductListRepositoryProtocol) {
        self.repository = repository
    }
    
    func viewDidLoad() {
        view?.showSpinnerView()
    }
    
    func onSearchTextSetted(toSearch: String) {
        getListData(toSearch: toSearch)
    }
    
    func onListItemTapped(itemId: String) {
        view?.goToDetailScreen(itemId: itemId)
    }
    
    func onGetDataSuccess(model: APIResponseModel) {
        if model.isEmpty() {
            view?.showEmptyView()
        } else {
            view?.removeSpinnerView()
            view?.fillList(model: model)
            self.model = model
        }
    }
    
    func onGetDataError() {
        //TODO: SHOW THE USER A SCREEN WITH THE ERROR
        print("Error in getItemsByName")
    }
    
    private func getListData(toSearch: String) {
        repository?.getProductListData(productName: toSearch, completionHandler: { [weak self] (Response, error) in
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
