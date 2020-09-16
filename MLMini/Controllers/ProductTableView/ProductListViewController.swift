//
//  ProductListViewController.swift
//  MLMini
//
//  Created by Gaston Alexis Garcia Carli on 20/09/2019.
//  Copyright © 2019 ale. All rights reserved.
//

import UIKit
import SDWebImage

protocol ProductListViewControllerProtocol: class {
    func showSpinnerView()
    func removeSpinnerView()
    func showEmptyView()
    func reloadView()
    func goToDetailScreen(rowIndex: Int)
    func fillList(model: APIResponseModel)
}

class ProductListViewController: UIViewController, ProductListViewControllerProtocol {
    
    @IBOutlet var productTableView: UITableView!
    @IBOutlet var noResultsIconView: UIView!
    @IBOutlet var noResultsView: UIView!
    @IBOutlet var noResultViewIcon: UIImageView!
    
    var presenter: ProductListPresenterProtocol?
    var model: APIResponseModel?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
            return .darkContent
    }
    
    lazy var spinner = SpinnerViewController()
    var apiResp: APIResponseModel?
    var service: APIAdapterProtocol!
    var toSearch = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //llevar la creacion de la instancia al instance
        presenter = ProductListPresenter(repository: ProductListRepository.init(ServiceManager()))
        presenter?.view = self
        initializeNoResultsFoundView()
        initializeProductTableView()
        presenter?.viewDidLoad()
        presenter?.onSearchTextSetted(toSearch: toSearch)
    }
    
    private func initializeNoResultsFoundView(){
        noResultsView.isHidden = true
        noResultsIconView.layer.cornerRadius = noResultsIconView.frame.height / 2
        noResultsIconView.clipsToBounds = true
        noResultViewIcon.image = UIImage(named: "Search")?.withRenderingMode(.alwaysTemplate)
        noResultViewIcon.tintColor = UIColor(named: "activeBackground")
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProductDetail" {
            if let detailProductViewController = segue.destination as? ProductDetailViewController, let index = sender as? IndexPath{
//                detailProductViewController.service = service
                detailProductViewController.itemIndexPath = index
            }
        }
    }
    
    func goToDetailScreen(rowIndex: Int) {
        performSegue(withIdentifier: "toProductDetail", sender: rowIndex)
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
        let productCell = UINib(nibName: "ProductViewCell", bundle: nil)
        productTableView.register(productCell, forCellReuseIdentifier: "ProductViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = productTableView.dequeueReusableCell(withIdentifier: "ProductViewCell", for: indexPath) as? ProductViewCell, let model = model else { return UITableViewCell() }
        let item = model.itemAt(index: indexPath.row)
        cell.configureCell(item: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.onListItemTapped(rowIndex: indexPath.row)
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
}



