//
//  SearchViewViewModel.swift
//  MLMini
//

import Foundation

class SearchViewViewModel {
    private var coordinator: SearchViewCoordinatorProtocol
    
    //MARK: - Initializers
    init(coordinator: SearchViewCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func onSearchButtonTap(textToSearch: String) {
        // TODO: Add logic to filter invalid text imputs (spaces cases)
        if !textToSearch.isEmpty {
            coordinator.navigateToProductListScreen(textToSearch: textToSearch)
        }
    }
}
