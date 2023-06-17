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
    func onErrorScreenRetryTapped()
}

class ProductListPresenter: ProductListPresenterProtocol {    
    
    //MARK: - Properties
    weak var view: ProductListViewControllerProtocol?
    private let repository: ProductListRepositoryProtocol
    private var model: APIResponseModel?
    private var productToSearch: String = ""
    private var cancellables = Set<AnyCancellable>()
    var coordinator: ProductListCoordinatorProtocol?
    
    //MARK: - Initializers
    required init(repository: ProductListRepositoryProtocol, productToSearch: String) {
        self.repository = repository
        self.productToSearch = productToSearch
    }
    
    func viewDidLoad() {
        searchForItem()
    }
    
    private func searchForItem() {
        view?.showSpinnerView()
        getListData()
    }
    
    func onListItemTapped(itemId: String) {
        coordinator?.navigateToItemDetailView(itemID: itemId)
    }
    
    func onErrorScreenRetryTapped() {
        searchForItem()
    }
    
    private func onGetDataSuccess(model: APIResponseModel) {
        view?.removeSpinnerView()
        if model.isEmpty() {
            view?.showEmptyView()
        } else {
            view?.fillList(model: model)
            self.model = model
        }
    }
    
    private func onGetDataError() {
        view?.removeSpinnerView()
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
