//
//  ProductDetailPresenter.swift
//  MLMini
//
//  Created by Alexis Garcia on 16/09/2020.
//  Copyright © 2020 ale. All rights reserved.
//

import Combine
import Foundation

protocol ProductDetailPresenterProtocol {
    func onViewLoaded()
}

class ProductDetailPresenter: ProductDetailPresenterProtocol {
    
    //MARK: - Properties
    private weak var view: ProductDetailViewControllerProtocol?
    private let repository: ProductDetailRepositoryProtocol?
    private var model: ItemDetailDomainModel?
    private var cancellables = Set<AnyCancellable>()
    private let itemId: String
    
    //MARK: - Initializers
    required init(repository: ProductDetailRepositoryProtocol,
                  view: ProductDetailViewControllerProtocol,
                  itemId: String) {
        self.repository = repository
        self.itemId = itemId
        self.view = view
    }
    
    func onViewLoaded() {
        getItemDescription(itemId: itemId)
    }
    
    private func onGetDataSuccess(model: ItemDetailDomainModel) {
        view?.updateModelAndReloadData(model: model)
        self.model = model
    }
    
    private func onGetDataError() {
        //TODO: SHOW THE USER AN ERROR SCREEN
    }
    
    private func getItemDescription(itemId: String) {
        repository?.getItemDescription(itemId: itemId)
            .receive(on: DispatchQueue.main)
            .map { $0.toModel() }
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
