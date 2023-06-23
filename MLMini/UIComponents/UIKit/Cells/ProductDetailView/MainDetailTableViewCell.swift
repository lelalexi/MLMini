//
//  MainDetailTableViewCell.swift
//  MLMini
//
//  Created by Gaston Alexis Garcia Carli on 22/09/2019.
//  Copyright © 2019 ale. All rights reserved.
//

import UIKit

class MainDetailTableViewCell: UITableViewCell {
    @IBOutlet var soldItems: UILabel!
    @IBOutlet var title: UILabel!
    @IBOutlet var soldByLabel: UILabel!
    @IBOutlet var seller: UILabel!
    @IBOutlet var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initializeCell()
    }
    
    private func initializeCell(){
        contentView.backgroundColor = .primaryBackground
        configureLabels()
    }
    
    private func configureLabels() {
        // TODO: Create a Font definition and update labels
        soldItems.textColor = .terciaryText
        title.textColor = .primaryText
        price.textColor = .primaryText
        soldByLabel.textColor = .terciaryText
        soldByLabel.text = MLLocalizables.ProductDetailView.soldByItemsLabel
        seller.textColor = .secondaryText
    }
    
    func configureCell(item: ItemDescriptionModel){
        title.text = item.title
        price.text = "$ " + String(item.price.formattedWithSeparator)
        soldItems.text = String(item.soldQuantity) + " " + MLLocalizables.ProductDetailView.soldItemsLabel
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
