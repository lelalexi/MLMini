//
//  APIServiceProtocol.swift
//  MLMini
//
//  Created by Gaston Alexis Garcia Carli on 20/09/2019.
//  Copyright © 2019 ale. All rights reserved.
//
import UIKit

protocol APIAdapterProtocol {
    
    /// Request to the API data about an item name
    func getItemsByName(name: String, completionHandler: @escaping (Error?) -> Void)
    
    /// Request to the API data about an item at a determined index
    func getItemDescriptionByIndex(index: Int, completionHandler: @escaping (ItemDescriptionModel?, Error?) -> Void) -> Void
    
    /// Returns true if no results are available
    func emptyResults() -> Bool
    
    /// Returns the number of items/products of the result
    func numberOfItems() -> Int
    
    /// Returns an item at an specific index
    func itemAt(index: Int) -> ItemModel
}

