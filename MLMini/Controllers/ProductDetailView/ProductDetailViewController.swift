//
//  ProductDetailViewController.swift
//  MLMini
//
//  Created by Gaston Alexis Garcia Carli on 20/09/2019.
//  Copyright © 2019 ale. All rights reserved.
//

import UIKit
import SDWebImage

protocol ProductDetailViewControllerProtocol: AnyObject {
    func updateModelAndReloadData(model: ItemDescriptionModel)
}
// swiftlint: disable implicitly_unwrapped_optional
class ProductDetailViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    //MARK: - IBOutlets
    @IBOutlet weak var productDetailTableView: UITableView!
    @IBOutlet weak var productDetailCarrouselCollectionView: UICollectionView!
    
    //MARK: - Properties
    private var presenter: ProductDetailPresenterProtocol?
    internal var collectionFlowLayout: UICollectionViewFlowLayout!
    private var images: [String]?
    var model: ItemDescriptionModel?
    var itemId = ""
    
    struct Constants {
        static let DETAIL_MAIN_TABLE_VIEW_CELL = "MainDetailTableViewCell"
        static let DETAIL_BUY_TABLE_VIEW_CELL = "BuyDetailTableViewCell"
        static let DETAIL_PRODUCT_IMAGE_CELL = "ProductImageCell"
        static let TOTAL_NUMBER_OF_CELLS_IN_DETAIL_SCREEN = 2
        static let MAIN_TABLEVIEW_CELL_POSITION = 0
        static let BUY_TABLEVIEW_CELL_POSITION = 1
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
            return .darkContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ProductDetailPresenter(repository: ProductDetailRepository.init(NetworkServiceManager()))
        presenter?.view = self
        setupNavBarAppearance()
        initializeDetailTableView()
        initialiceCollectionView()
        presenter?.viewDidLoad()
        presenter?.onItemIdSetted(itemId: itemId)
    }
}

// MARK: - Protocol
extension ProductDetailViewController: ProductDetailViewControllerProtocol {
    
    func updateModelAndReloadData(model: ItemDescriptionModel) {
        self.model = model
        productDetailCarrouselCollectionView.reloadData()
        productDetailTableView.reloadData()
    }
}

// MARK: - TableView
extension ProductDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func initializeDetailTableView(){
        registerTableCells()
        productDetailTableView.backgroundColor = .primaryBackground
        productDetailTableView.delegate = self
        productDetailTableView.dataSource = self
    }
    
    private func registerTableCells(){
        // Main cell
        let detailCell = UINib(nibName: Constants.DETAIL_MAIN_TABLE_VIEW_CELL, bundle: nil)
        productDetailTableView.register(detailCell, forCellReuseIdentifier: Constants.DETAIL_MAIN_TABLE_VIEW_CELL)
        
        //Buy cell
        let buyCell = UINib(nibName: Constants.DETAIL_BUY_TABLE_VIEW_CELL, bundle: nil)
        productDetailTableView.register(buyCell, forCellReuseIdentifier: Constants.DETAIL_BUY_TABLE_VIEW_CELL)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.TOTAL_NUMBER_OF_CELLS_IN_DETAIL_SCREEN
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case Constants.MAIN_TABLEVIEW_CELL_POSITION:
            guard let cell = productDetailTableView.dequeueReusableCell(withIdentifier: Constants.DETAIL_MAIN_TABLE_VIEW_CELL, for: indexPath) as? MainDetailTableViewCell, let model = model else { return UITableViewCell() }
            cell.configureCell(item: model)
            return cell
        case Constants.BUY_TABLEVIEW_CELL_POSITION:
            guard let cell = productDetailTableView.dequeueReusableCell(withIdentifier: Constants.DETAIL_BUY_TABLE_VIEW_CELL, for: indexPath) as? BuyDetailTableViewCell, let model = model else { return UITableViewCell() }
            cell.configureCell(item: model)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}
