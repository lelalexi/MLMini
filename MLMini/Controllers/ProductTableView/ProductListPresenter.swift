//
//  ProductListPresenter.swift
//  MLMini
//
//  Created by Alexis Garcia on 14/09/2020.
//  Copyright © 2020 ale. All rights reserved.
//

import Combine
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
    private let repository: ProductListRepositoryProtocol
    var model: APIResponseModel?
    var productToSearch: String = ""
    private var cancellables = Set<AnyCancellable>()
    
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
        repository.getProductListData(productName: productToSearch)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.onGetDataError()
                case .finished:
                    break
                }
            }, receiveValue: { response in
                self.onGetDataSuccess(model: response)
            }).store(in: &cancellables)
    }
}
