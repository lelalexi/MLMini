//
//  APIServiceProtocol.swift
//  MLMini
//
//  Created by Gaston Alexis Garcia Carli on 20/09/2019.
//  Copyright © 2019 ale. All rights reserved.
//
import UIKit

struct Item {
    let price: Double
    let title: String
    let thumbnail: String
}

protocol APIServiceProtocol {
    
    func performItemSearchByName <T: Codable> (apiURL: URL, completionHandler: @escaping (T?, Error?) -> Void)
    
    // TODO: Hacer este metodo constructor
    func getItemsByName(name: String, completionHandler: @escaping (Error?) -> Void)
    
    func emptyResults() -> Bool
    
    func numberOfItems() -> Int
    
    func itemAt(index: Int) -> Item
}
