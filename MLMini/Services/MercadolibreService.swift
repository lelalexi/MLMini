//
//  MercadolibreService.swift
//  MLMini
//
//  Created by Gaston Alexis Garcia Carli on 20/09/2019.
//  Copyright © 2019 ale. All rights reserved.
//

import UIKit

public class MercadolibreService: APIServiceProtocol {
    
    var response: APIResponse?
    
    func getItemsByName(name: String, completionHandler: @escaping (Error?) -> Void){
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.mercadolibre.com"
        urlComponents.path = "/sites/MLA/search"
        let queryItem = URLQueryItem(name: "q", value: name)
        urlComponents.queryItems = [queryItem]
        let wawa = urlComponents.url
        
        
        performItemSearchByName(apiURL: wawa!) { [weak self] (response: APIResponse?, error: Error?) -> Void in
            if (error != nil){
                completionHandler(error)
            } else {
                self?.response = response
                completionHandler(nil)
            }
        }
    }
    
    func emptyResults() -> Bool {
        return response?.results.isEmpty ?? true
    }
    
    func numberOfItems() -> Int {
        return response?.results.count ?? 0
    }
    
    func itemAt(index: Int) -> Item {
        var item = Item(price: 0, title: "", thumbnail: "Placeholder")
        if let resp = response?.results[index] {
            item = Item(price: resp.price,
                        title: resp.title,
                        thumbnail: resp.thumbnail)
        }
        return item
    }
    
    
    func performItemSearchByName<T>(apiURL: URL, completionHandler: @escaping (T?, Error?) -> Void) where T : Decodable, T : Encodable {

        let sharedSession = URLSession.shared

        sharedSession.dataTask(with: apiURL) { data, response, error in
            if let data = data {
                do {
                    let resp = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(resp, nil)
                } catch let error {
                    completionHandler(nil, error)
                    }
            }
        }.resume()
    }
   
}
