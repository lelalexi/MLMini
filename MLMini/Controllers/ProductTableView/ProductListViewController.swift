//
//  ProductListViewController.swift
//  MLMini
//
//  Created by Gaston Alexis Garcia Carli on 20/09/2019.
//  Copyright © 2019 ale. All rights reserved.
//

import UIKit
import SDWebImage

protocol ProductListViewControllerProtocol: AnyObject {
    func showSpinnerView()
    func removeSpinnerView()
    func showEmptyView()
    func showErrorView()
    func reloadView()
    func fillList(model: APIResponseModel)
}

class ProductListViewController: UIViewController, ProductListViewControllerProtocol {
    private lazy var productTableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isHidden = true
        table.backgroundColor = .white
        return table
    }()
    
    private lazy var feedbackView: MLGenericFeedbackScreenComponent = {
        let view = MLGenericFeedbackScreenComponent()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var presenter: ProductListPresenterProtocol?
    private var model: APIResponseModel? //The view should not have a model reference
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
            return .darkContent
    }
    
    private lazy var spinner = SpinnerViewController()
    
    init(presenter: ProductListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeProductTableView()
        setupNavBarAppearance()
        presenter?.viewDidLoad()
    }

    func fillList(model: APIResponseModel) {
        self.model = model
        reloadView()
    }
    
    func showSpinnerView() {
        // add the spinner to the view
        feedbackView.removeFromSuperview()
        addChild(spinner)
        spinner.view.frame = view.frame
        view.addSubview(spinner.view)
        spinner.didMove(toParent: self)
    }
    
    func removeSpinnerView() {
        // remove the spinner from the view
        self.spinner.willMove(toParent: nil)
        self.spinner.view.removeFromSuperview()
        self.spinner.removeFromParent()
    }
}

// MARK: - TableView
extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func initializeProductTableView(){
        productTableView.delegate = self
        productTableView.dataSource = self
        setupTableviewConstraints()
        registerTableCells()
        //Set tableview automatic row heigth to true
        productTableView.rowHeight = UITableView.automaticDimension
        productTableView.estimatedRowHeight = 140
    }
    
    private func setupTableviewConstraints() {
        view.addSubview(productTableView)
        
        NSLayoutConstraint.activate([
            self.productTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.productTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.productTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.productTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    private func registerTableCells(){
        let productCell = UINib(nibName: MLMiniConstants.Xibs.PRODUCT_VIEW_CELL, bundle: nil)
        productTableView.register(productCell, forCellReuseIdentifier: MLMiniConstants.Xibs.PRODUCT_VIEW_CELL)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = productTableView.dequeueReusableCell(withIdentifier: MLMiniConstants.Xibs.PRODUCT_VIEW_CELL, for: indexPath) as? ProductViewCell, let model = model else { return UITableViewCell() }
        let item = model.itemAt(index: indexPath.row)
        cell.configureCell(item: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let itemId = model?.itemAt(index: indexPath.row).id else { return }
        presenter?.onListItemTapped(itemId: itemId)
    }
}

extension ProductListViewController {
    func reloadView() {
        self.productTableView.isHidden = false
        self.productTableView.reloadData()
    }
    
    func showEmptyView() {
        feedbackView.type = .itemNotFound
        feedbackView.callback = { [unowned self] in
            self.navigationController?.popViewController(animated: true)
        }
        showFeedbackView()
    }
    
    func showErrorView() {
        feedbackView.type = .miscError
        feedbackView.callback = { [unowned self] in
            self.presenter?.onErrorScreenRetryTapped()
        }
        showFeedbackView()
    }
    
    private func showFeedbackView() {
        self.feedbackView.removeFromSuperview()
        self.removeSpinnerView()
        self.view.addSubview(self.feedbackView)
        NSLayoutConstraint.activate([
            self.feedbackView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.feedbackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.feedbackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.feedbackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}
