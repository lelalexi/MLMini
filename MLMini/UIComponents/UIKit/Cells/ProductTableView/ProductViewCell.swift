//
//  productViewCell.swift
//  MLMini
//
//  Created by Gaston Alexis Garcia Carli on 20/09/2019.
//  Copyright © 2019 ale. All rights reserved.
//

import UIKit

class ProductViewCell: UITableViewCell {
    @IBOutlet var productTitle: UILabel!
    @IBOutlet var productImage: UIImageView!
    @IBOutlet var productPrice: UILabel!
    @IBOutlet var productFavIcon: UIImageView!
    @IBOutlet var freeShippingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initCell()
    }
    
    private func initCell(){
        contentView.backgroundColor = .primaryBackground
        configureLabels()
        configureCellImage()
        configureFreeShippingLabels()
        configureCellFavIcon()
    }
    
    private func configureLabels() {
        productTitle.textColor = .secondaryText
        productPrice.textColor = .primaryText
    }
    
    private func configureCellImage() {
        productImage.backgroundColor = .clear
        productImage.layer.cornerRadius = 6.0
        productImage.clipsToBounds = true
    }
    
    private func configureFreeShippingLabels() {
        freeShippingLabel.textColor = .activeGreen
        freeShippingLabel.isHidden = true
        freeShippingLabel.text = MLLocalizables.ProductListView.freeShippingLabel
    }
    
    private func configureCellFavIcon() {
        productFavIcon.image = productFavIcon.image?.withRenderingMode(.alwaysTemplate)
        productFavIcon.tintColor = .activeBlue
    }
    
    func configureCell(item: ItemModel){
        productTitle.text = item.title
        productPrice.text = "$ " + String(item.price.formattedWithSeparator)
        productImage.sd_setImage(with: URL(string: item.thumbnail), placeholderImage: UIImage(named: MLMiniConstants.Images.PLACEHOLDER_ICON))
        freeShippingLabel.isHidden = !item.freeShipping
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
