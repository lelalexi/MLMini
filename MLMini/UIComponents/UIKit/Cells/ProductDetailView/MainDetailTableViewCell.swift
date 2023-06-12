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
    @IBOutlet var seller: UILabel!
    @IBOutlet var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initializeCell()
    }
    
    private func initializeCell(){
        backgroundColor = UIColor(named: MLMiniConstants.Color.SOFT_GREY)
    }
    
    func configureCell(item: ItemDescriptionModel){

        title.text = item.title
        price.text = "$ " + String(item.price.formattedWithSeparator)
        soldItems.text = String(item.soldQuantity) + " vendidos"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
