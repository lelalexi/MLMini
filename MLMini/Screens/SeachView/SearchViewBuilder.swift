//
//  SearchViewBuilder.swift
//  MLMini
//

import SwiftUI
import UIKit

struct SearchViewBuilder {
    func getView(coordinator: ProductListCoordinatorProtocol?) -> SearchView {
        let viewModel = SearchViewViewModel(coordinator: coordinator)
        let view = SearchView(viewModel: viewModel)
        return view
    }
}
