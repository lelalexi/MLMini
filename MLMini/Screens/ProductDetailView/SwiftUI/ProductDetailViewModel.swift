//
//  ProductDetailViewModel.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 28/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

protocol ProductDetailViewModelProtocol: ObservableObject {
    var updateDataPublisher: AnyPublisher<ItemDetailDomainModel, Never> { get }
}

class ProductDetailViewModel: ProductDetailViewModelProtocol, ObservableObject {
    // MARK: Properties
    private let repository: ProductDetailRepositoryProtocol
    private var cancellables = Set<AnyCancellable>()
    @Published var itemDetailModel: ItemDetailDomainModel?
    @Published var itemDescriptionModel: ItemDescriptionDomainModel?
    
    // MARK: Public available publishers (Not allow users to know about publisher implementation, just knowing that conforms to AnyPublisher protocol)
    let updateDataPublisher: AnyPublisher<ItemDetailDomainModel, Never>
    
    // MARK: Private publisher implementation
    private let updateData = PassthroughSubject<ItemDetailDomainModel, Never>()
    
    init(repository: ProductDetailRepositoryProtocol,
         itemId: String) {
        self.repository = repository
        updateDataPublisher = updateData.eraseToAnyPublisher()
        getItemDescription(itemId: itemId)
    }
    
    private func onGetDataSuccess(model: ItemDetailDomainModel,
                                  itemDescriptionModel: ItemDescriptionDomainModel) {
        updateData.send(model)
        self.itemDetailModel = model
        self.itemDescriptionModel = itemDescriptionModel
    }
    
    private func onGetDataError() {
        //TODO: SHOW THE USER AN ERROR SCREEN
    }
    
    private func getItemDescription(itemId: String) {
        repository.getItemDetail(itemId: itemId)
            .combineLatest(repository.getItemDescription(itemId: itemId))
            .receive(on: DispatchQueue.main)
            .map { (itemDetail: $0.0.toModel(), itemDescription: $0.1.toModel())}
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.onGetDataError()
                case .finished:
                    break
                }
            }, receiveValue: { response in
                self.onGetDataSuccess(model: response.itemDetail,
                                      itemDescriptionModel: response.itemDescription)
            }).store(in: &cancellables)
    }
}
