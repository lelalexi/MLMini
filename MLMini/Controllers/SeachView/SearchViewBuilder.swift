//
//  SearchViewBuilder.swift
//  MLMini
//

import SwiftUI
import UIKit

struct SearchViewBuilder {
    func getView(forController controller: UIViewController) -> SearchView {
        let coordinator = SearchViewCoordinator(controller: controller)
        let viewModel = SearchViewViewModel(coordinator: coordinator)
        let view = SearchView(viewModel: viewModel)
        return view
    }
}
