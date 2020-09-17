//
//  BuyDetailTableViewCell.swift
//  MLMini
//
//  Created by Gaston Alexis Garcia Carli on 22/09/2019.
//  Copyright © 2019 ale. All rights reserved.
//

import UIKit

class BuyDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var itemColor: UILabel!
    @IBOutlet weak var itemQuantity: UILabel!
    @IBOutlet weak var buyButton: UIView!
    @IBOutlet weak var addToCartButton: UIView!
    @IBOutlet weak var addToCartLabel: UILabel!
    @IBOutlet weak var colorAndQuantiyView: UIView!
    @IBOutlet weak var itemColorThumbnail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initializeView()
    }

    func initializeView() {
        
        colorAndQuantiyView.layer.cornerRadius = 4.0
        colorAndQuantiyView.clipsToBounds = true
        
        itemColor.textColor = UIColor(named: "intermediateGrey")
        itemQuantity.textColor = UIColor(named: "intermediateGrey")
        
        itemColorThumbnail.layer.borderWidth = 1.0
        itemColorThumbnail.layer.borderColor = UIColor(named: "intermediateGrey")?.cgColor
        itemColorThumbnail.layer.cornerRadius = 2.0
        
        buyButton.backgroundColor = UIColor(named: "activeBlue")
        buyButton.layer.cornerRadius = 4.0
        buyButton.clipsToBounds = true
        
        addToCartButton.backgroundColor = .clear
        addToCartButton.layer.cornerRadius = 4.0
        addToCartButton.clipsToBounds = true
        addToCartButton.layer.borderColor = UIColor(named: "activeBlue")?.cgColor
        addToCartButton.layer.borderWidth = 1.0
        
        addToCartLabel.textColor = UIColor(named: "activeBlue")
        
    }
    
    func configureCell(item: ItemDescriptionModel){
        
        itemColorThumbnail.sd_setImage(with: URL(string: item.thumbnail), placeholderImage: UIImage(named: "Placeholder"))
    }
    
}
