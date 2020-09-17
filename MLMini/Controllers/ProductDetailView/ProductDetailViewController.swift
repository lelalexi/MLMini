//
//  ProductDetailViewController.swift
//  MLMini
//
//  Created by Gaston Alexis Garcia Carli on 20/09/2019.
//  Copyright © 2019 ale. All rights reserved.
//

import UIKit
import SDWebImage

protocol ProductDetailViewControllerProtocol: class {
    func updateModelAndReloadData(model: ItemDescriptionModel)
}

class ProductDetailViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var productDetailTableView: UITableView!
    @IBOutlet weak var productDetailCarrouselCollectionView: UICollectionView!
    
    var presenter: ProductDetailPresenterProtocol?
   
    var collectionFlowLayout: UICollectionViewFlowLayout!
    var images: [String]?
    var model: ItemDescriptionModel?
    var itemId = ""
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
            return .darkContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ProductDetailPresenter(repository: ProductDetailRepository.init(ServiceManager()))
        presenter?.view = self
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
        productDetailTableView.backgroundColor = UIColor(named: "softGrey")
        productDetailTableView.delegate = self
        productDetailTableView.dataSource = self
    }
    
    private func registerTableCells(){
        // Main cell
        let detailCell = UINib(nibName: "MainDetailTableViewCell", bundle: nil)
        productDetailTableView.register(detailCell, forCellReuseIdentifier: "MainDetailTableViewCell")
        
        //Buy cell
        let buyCell = UINib(nibName: "BuyDetailTableViewCell", bundle: nil)
        productDetailTableView.register(buyCell, forCellReuseIdentifier: "BuyDetailTableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = productDetailTableView.dequeueReusableCell(withIdentifier: "MainDetailTableViewCell", for: indexPath) as? MainDetailTableViewCell, let model = model else { return UITableViewCell() }
            cell.configureCell(item: model)
            return cell
        case 1:
            guard let cell = productDetailTableView.dequeueReusableCell(withIdentifier: "BuyDetailTableViewCell", for: indexPath) as? BuyDetailTableViewCell, let model = model else { return UITableViewCell() }
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

// MARK: - Detail Images Carroussel
extension ProductDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func initialiceCollectionView(){
        setCollectionViewLayout()
        productDetailCarrouselCollectionView.delegate = self
        productDetailCarrouselCollectionView.dataSource = self
    }
    
    private func setCollectionViewLayout(){
        collectionFlowLayout = UICollectionViewFlowLayout()
        collectionFlowLayout.scrollDirection = .horizontal
        collectionFlowLayout.minimumLineSpacing = 0.0
        collectionFlowLayout.itemSize = CGSize(width: view.frame.width,
                                               height: productDetailCarrouselCollectionView.frame.height)
        productDetailCarrouselCollectionView.setCollectionViewLayout(collectionFlowLayout, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.pictures.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = productDetailCarrouselCollectionView.dequeueReusableCell(withReuseIdentifier: "ProductImageCell", for: indexPath ) as? ProductImageViewCell else { return UICollectionViewCell() }
        cell.configureCell(image: model?.pictures[indexPath.item] ?? "")
        return cell
    }
}
