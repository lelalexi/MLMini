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

protocol ProductDetailViewModel: ObservableObject {
    var itemDetailState: MLDataState<ItemDetailDomainModel> { get set }
    var itemDescriptionState: MLDataState<ItemDescriptionDomainModel> { get set }
    var sellerInformationState: MLDataState<MLSellerReputationDomainModel> { get set }
}

class ProductDetailViewModelDefault: ProductDetailViewModel, ObservableObject {
    // MARK: Properties
    private let repository: ProductDetailRepositoryProtocol
    private var cancellables = Set<AnyCancellable>()
    
    @Published var itemDetailState: MLDataState<ItemDetailDomainModel> = MLDataState.isLoading
    @Published var itemDescriptionState: MLDataState<ItemDescriptionDomainModel> = MLDataState.isLoading
    @Published var sellerInformationState: MLDataState<MLSellerReputationDomainModel> = MLDataState.isLoading
    
    init(repository: ProductDetailRepositoryProtocol,
         itemId: String) {
        self.repository = repository
        getItemDescription(itemId: itemId)
    }
    
    private func onGetDataSuccess(model: ItemDetailDomainModel,
                                  itemDescriptionModel: ItemDescriptionDomainModel) {
        itemDetailState = .success(model: model)
        itemDescriptionState = .success(model: itemDescriptionModel)
        
        getUserInformation(userID: model.sellerID)
    }
    
    private func onGetUserInformationSuccess(model: MLUserInformationDomainModel) {
        sellerInformationState = .success(model: model.sellerReputation)
    }
    
    private func onGetDataError() {
        //TODO: SHOW THE USER AN ERROR SCREEN
        itemDetailState = .error
        itemDescriptionState = .error
        sellerInformationState = .error
    }
    
    private func getItemDescription(itemId: String) {
        itemDetailState = .isLoading
        itemDescriptionState = .isLoading

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
        sellerInformationState = .isLoading
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
