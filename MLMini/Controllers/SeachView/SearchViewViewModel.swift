//
//  SearchViewViewModel.swift
//  MLMini
//

import Foundation

class SearchViewViewModel {
    private weak var coordinator: ProductListCoordinatorProtocol?
    
    //MARK: - Initializers
    init(coordinator: ProductListCoordinatorProtocol?) {
        self.coordinator = coordinator
    }
    
    func onSearchButtonTap(textToSearch: String) {
        // TODO: Add logic to filter invalid text imputs (spaces cases)
        if !textToSearch.isEmpty {
            coordinator?.navigateToProductList(itemToSearch: textToSearch)
        }
    }
}
