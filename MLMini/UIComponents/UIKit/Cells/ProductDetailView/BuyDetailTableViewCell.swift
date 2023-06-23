//
//  BuyDetailTableViewCell.swift
//  MLMini
//
//  Created by Gaston Alexis Garcia Carli on 22/09/2019.
//  Copyright © 2019 ale. All rights reserved.
//

import UIKit

// Acordingly to SOLID, this is not in compliance with Single responsability principle.
// The main cause is that Button and productDescription build/UI config should not be responsability of BuyDetailView
// TODO: Create a Button component and migrate this
class BuyDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var itemColor: UILabel!
    @IBOutlet weak var itemQuantity: UILabel!
    @IBOutlet weak var buyButton: UIView!
    @IBOutlet weak var buyButtonLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIView!
    @IBOutlet weak var addToCartButtonLabel: UILabel!
    @IBOutlet weak var addToCartLabel: UILabel!
    @IBOutlet weak var colorAndQuantiyView: UIView!
    @IBOutlet weak var colorTitleLabel: UILabel!
    @IBOutlet weak var quantityTitleLabel: UILabel!
    @IBOutlet weak var itemColorThumbnail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initializeView()
    }

    private func initializeView() {
        contentView.backgroundColor = .primaryBackground
        configureProductDescription()
        configureButtons()
    }
    
    // TODO: Create a productDetail component and migrate this
    private func configureProductDescription() {
        colorAndQuantiyView.layer.cornerRadius = 4.0
        colorAndQuantiyView.clipsToBounds = true
        
        colorTitleLabel.textColor = .primaryText
        colorTitleLabel.text = MLLocalizables.ProductDetailView.itemColorLabel
        quantityTitleLabel.textColor = .primaryText
        quantityTitleLabel.text = MLLocalizables.ProductDetailView.availableItemQuantityLabel
        itemColor.textColor = .terciaryText
        itemQuantity.textColor = .terciaryText
        
        itemColorThumbnail.layer.borderWidth = 1.0
        itemColorThumbnail.layer.borderColor = UIColor.softGrey.cgColor
        itemColorThumbnail.layer.cornerRadius = 2.0
    }

    // TODO: Create a Button component and migrate this
    private func configureButtons() {
        buyButton.backgroundColor = .activeBlue
        buyButton.layer.cornerRadius = 4.0
        buyButton.clipsToBounds = true
        
        buyButtonLabel.textColor = .invertedText
        buyButtonLabel.text = MLLocalizables.ProductDetailView.buyButtonLabel
        
        addToCartButton.backgroundColor = .clear
        addToCartButton.layer.cornerRadius = 4.0
        addToCartButton.clipsToBounds = true
        addToCartButton.layer.borderColor = UIColor.activeBlue.cgColor
        addToCartButton.layer.borderWidth = 1.0
        
        addToCartLabel.textColor = .activeBlue
        addToCartLabel.text = MLLocalizables.ProductDetailView.addToCartButtonLabel
    }
    
    func configureCell(item: ItemDescriptionModel){
        itemColorThumbnail.sd_setImage(with: URL(string: item.thumbnail), placeholderImage: UIImage(named: MLMiniConstants.Images.PLACEHOLDER_ICON))
    }
}
