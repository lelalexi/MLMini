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
    func onSearchTextSetted()
    func onErrorScreenRetryTapped()
}

class ProductListPresenter: ProductListPresenterProtocol {    
    
    //MARK: - Properties
    weak var view: ProductListViewControllerProtocol?
    let repository: ProductListRepositoryProtocol?
    var model: APIResponseModel?
    var productToSearch: String = ""
    
    //MARK: - Initializers
    required init(repository: ProductListRepositoryProtocol, productToSearch: String) {
        self.repository = repository
        self.productToSearch = productToSearch
    }
    
    func viewDidLoad() {
        view?.showSpinnerView()
    }
    
    func onSearchTextSetted() {
        getListData()
    }
    
    func onListItemTapped(itemId: String) {
        view?.goToDetailScreen(itemId: itemId)
    }
    
    func onErrorScreenRetryTapped() {
        view?.showSpinnerView()
        view?.onDataErrorRetry()
        getListData()
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
        view?.showErrorView()
    }
    
    private func getListData() {
        repository?.getProductListData(productName: productToSearch, completionHandler: { [weak self] (Response, error) in
            if let _ = error {
                self?.onGetDataError()
            }
            guard let response = Response else { return }
            DispatchQueue.main.async {
                self?.onGetDataSuccess(model: response)
                //self?.onGetDataError()
            }
        })
    }
}
