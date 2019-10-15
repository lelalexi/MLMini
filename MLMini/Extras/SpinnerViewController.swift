//
//  SpinningWheel.swift
//  MLMini
//
//  Created by Gaston Alexis Garcia Carli on 23/09/2019.
//  Copyright © 2019 ale. All rights reserved.
//

import UIKit

class SpinnerViewController: UIViewController {
    
    var spinner = UIActivityIndicatorView(style: .large)
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor(named: "activeBackground")
        
        spinner.tintColor = UIColor(named: "darkBlue")
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        view.addSubview(spinner)
        
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
