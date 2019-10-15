//
//  ProductDetailViewController.swift
//  MLMini
//
//  Created by Gaston Alexis Garcia Carli on 20/09/2019.
//  Copyright © 2019 ale. All rights reserved.
//

import UIKit
import SDWebImage

class ProductDetailViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var productDetailTableView: UITableView!
    @IBOutlet weak var productDetailCarrouselCollectionView: UICollectionView!
   
    var collectionFlowLayout: UICollectionViewFlowLayout!
    var itemIndexPath: IndexPath?
    var service: APIAdapterProtocol?
    var item: ItemDescription?
    var images: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeDetailTableView()
        initialiceCollectionView()
        loadDataFromAPI()
    }
}

// MARK: - Data Loading
extension ProductDetailViewController {
    
    private func loadDataFromAPI(){
        service?.getItemDescriptionByIndex(index: itemIndexPath!.row) { [weak self] (resp: ItemDescription?, error: Error?) -> Void in
            if (error != nil){
                print(error)
            } else {
                self?.item = resp
                DispatchQueue.main.async {
                    self?.productDetailCarrouselCollectionView.reloadData()
                    self?.productDetailTableView.reloadData()
                }
            }
        }
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
            guard let cell = productDetailTableView.dequeueReusableCell(withIdentifier: "MainDetailTableViewCell", for: indexPath) as? MainDetailTableViewCell, let safeItem = item else { return UITableViewCell() }
            cell.configureCell(item: safeItem)
            return cell
        case 1:
            guard let cell = productDetailTableView.dequeueReusableCell(withIdentifier: "BuyDetailTableViewCell", for: indexPath) as? BuyDetailTableViewCell, let safeItem = item else { return UITableViewCell() }
            cell.configureCell(item: safeItem)
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
        return item?.pictures.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = productDetailCarrouselCollectionView.dequeueReusableCell(withReuseIdentifier: "ProductImageCell", for: indexPath ) as? ProductImageViewCell else { return UICollectionViewCell() }
        cell.configureCell(image: item?.pictures[indexPath.item] ?? "")
        return cell
    }
}
