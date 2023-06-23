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
    
    var view: ProductDetailViewControllerProtocol? { get set }
    func viewDidLoad()
    func onItemIdSetted(itemId: String)
}

class ProductDetailPresenter: ProductDetailPresenterProtocol {
    
    //MARK: - Properties
    weak var view: ProductDetailViewControllerProtocol?
    private let repository: ProductDetailRepositoryProtocol?
    var model: ItemDescriptionModel?
    private var cancellables = Set<AnyCancellable>()
    
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
