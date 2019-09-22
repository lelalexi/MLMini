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
    
    @IBOutlet weak var productDetailCarrouselCollectionView: UICollectionView!
    var collectionFlowLayout: UICollectionViewFlowLayout!
    
    var itemIndexPath: IndexPath?
    var service: APIServiceProtocol?
    var item: ItemDescription?
    
    var images: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialiceCollectionView()
        
        service?.getItemDescriptionByIndex(index: itemIndexPath!.row) { [weak self] (resp: ItemDescription?, error: Error?) -> Void in
            if (error != nil){
                print("ocurrio un error")
            } else {
                self?.item = resp
                DispatchQueue.main.async {
                    self?.productDetailCarrouselCollectionView.reloadData()
                }
            }
        }
    }
}

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
