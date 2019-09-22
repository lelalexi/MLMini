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

struct ItemDescription {
    let price: Double
    let title: String
    let pictures: [String]
}

protocol APIServiceProtocol {
    
    func performRequest <T: Codable> (apiURL: URL, completionHandler: @escaping (T?, Error?) -> Void)
    
    func getItemsByName(name: String, completionHandler: @escaping (Error?) -> Void)
    
    func getItemDescriptionByIndex(index: Int, completionHandler: @escaping (ItemDescription?, Error?) -> Void) -> Void
    
    func emptyResults() -> Bool
    
    func numberOfItems() -> Int
    
    func itemAt(index: Int) -> Item
}

