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
    func goToDetailScreen(itemId: String)
    func fillList(model: APIResponseModel)
    func onDataErrorRetry()
}

class ProductListViewController: UIViewController, ProductListViewControllerProtocol {
    
    @IBOutlet var productTableView: UITableView!
    @IBOutlet var noResultsIconView: UIView!
    @IBOutlet var noResultsView: UIView!
    @IBOutlet var noResultViewIcon: UIImageView!
    
    
    private lazy var errorView: MLGenericErrorScreen = {
        let view = MLGenericErrorScreen { [unowned self] in
            self.presenter?.onErrorScreenRetryTapped()
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var presenter: ProductListPresenterProtocol?
    var model: APIResponseModel?
    let productDetailSegueIdentifier = "toProductDetail"
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
            return .darkContent
    }
    
    lazy var spinner = SpinnerViewController()
    var apiResp: APIResponseModel?
    var toSearch = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //llevar la creacion de la instancia al instance
        presenter = ProductListPresenter(repository: ProductListRepository.init(ServiceManager()),
                                         productToSearch: toSearch)
        presenter?.view = self
        initializeNoResultsFoundView()
        initializeProductTableView()
        setupNavBarAppearance()
        presenter?.viewDidLoad()
        presenter?.onSearchTextSetted()
    }
    
    private func initializeNoResultsFoundView(){
        noResultsView.isHidden = true
        noResultsIconView.layer.cornerRadius = noResultsIconView.frame.height / 2
        noResultsIconView.clipsToBounds = true
        noResultViewIcon.image = UIImage(named: MLMiniConstants.Images.SEARCH_ICON)?.withRenderingMode(.alwaysTemplate)
        noResultViewIcon.tintColor = UIColor(named: MLMiniConstants.Color.ACTIVE_BACKGROUND)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == productDetailSegueIdentifier {
            if let detailProductViewController = segue.destination as? ProductDetailViewController, let itemId = sender as? String{
                detailProductViewController.itemId = itemId
            }
        }
    }
    
    func goToDetailScreen(itemId: String) {
        performSegue(withIdentifier: productDetailSegueIdentifier, sender: itemId)
    }
    
    func fillList(model: APIResponseModel) {
        self.model = model
        reloadView()
    }
    
    func showSpinnerView() {
        // add the spinner to the view
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
    
    func onDataErrorRetry() {
        errorView.removeFromSuperview()
        
    }
}

// MARK: - TableView
extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func initializeProductTableView(){
        productTableView.isHidden = true
        registerTableCells()
        //Set tableview automatic row heigth to true
        productTableView.rowHeight = UITableView.automaticDimension
        productTableView.estimatedRowHeight = 140
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
        DispatchQueue.main.async {
            self.productTableView.isHidden = false
            self.productTableView.reloadData()
        }
    }
    
    func showEmptyView() {
        DispatchQueue.main.async {
            self.removeSpinnerView()
            self.noResultsView.isHidden = false
        }
    }
    
    func showErrorView() {
        DispatchQueue.main.async {
            self.removeSpinnerView()
            self.view.addSubview(self.errorView)
            NSLayoutConstraint.activate([
                self.errorView.topAnchor.constraint(equalTo: self.view.topAnchor),
                self.errorView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                self.errorView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                self.errorView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            ])
        }
    }
}
