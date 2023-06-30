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
    @Published var itemDetailModel: ItemDetailDomainModel = ItemDetailDomainModel._default
    @Published var itemDescriptionModel: ItemDescriptionDomainModel = ItemDescriptionDomainModel._default
    @Published var userInformationModel: MLUserInformationDomainModel = MLUserInformationDomainModel._default
    
    // MARK: Public available publishers (Does not allow users to know about publisher implementation, just knowing that conforms to AnyPublisher protocol)
    let updateDataPublisher: AnyPublisher<ItemDetailDomainModel, Never>
    
    // MARK: Private publisher implementation
    private let updateData = CurrentValueSubject<ItemDetailDomainModel, Never>(ItemDetailDomainModel._default)
    
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

        getUserInformation(userID: itemDetailModel.sellerID)
    }
    
    private func onGetUserInformationSuccess(model: MLUserInformationDomainModel) {
        self.userInformationModel = model
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
    
    private func getUserInformation(userID: Int) {
        repository.getUserData(userId: userID)
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
                self.onGetUserInformationSuccess(model: response)
            }).store(in: &cancellables)
    }
}
