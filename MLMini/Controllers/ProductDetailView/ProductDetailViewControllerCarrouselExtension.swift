//
//  ProductDetailViewControllerCarrouselExtension.swift
//  MLMini
//
//  Created by Alexis Garcia on 30/09/2020.
//  Copyright © 2020 ale. All rights reserved.
//

import UIKit

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
        guard let cell = productDetailCarrouselCollectionView.dequeueReusableCell(withReuseIdentifier: MLMiniConstants.Xibs.DETAIL_PRODUCT_IMAGE_CELL, for: indexPath ) as? ProductImageViewCell else { return UICollectionViewCell() }
        cell.configureCell(image: model?.pictures[indexPath.item] ?? "")
        return cell
    }
}
