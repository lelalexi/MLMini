//
//  ProductImageViewCell.swift
//  MLMini
//
//  Created by Gaston Alexis Garcia Carli on 22/09/2019.
//  Copyright © 2019 ale. All rights reserved.
//

import UIKit
import SDWebImage

class ProductImageViewCell: UICollectionViewCell {
    @IBOutlet weak var productImage: UIImageView!
    
    func configureCell(image: String){
        productImage.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: MLMiniConstants.Images.PLACEHOLDER_ICON))
    }
}
