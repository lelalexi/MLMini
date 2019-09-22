//
//  MercadolibreService.swift
//  MLMini
//
//  Created by Gaston Alexis Garcia Carli on 20/09/2019.
//  Copyright © 2019 ale. All rights reserved.
//

import UIKit

enum UrlErrors: Error {
    case invalidUrl
}


public class MercadolibreService: APIServiceProtocol {
    
    var itemListResponse: APIResponse?
    
    func getItemsByName(name: String, completionHandler: @escaping (Error?) -> Void){
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.mercadolibre.com"
        urlComponents.path = "/sites/MLA/search"
        let queryItem = URLQueryItem(name: "q", value: name)
        urlComponents.queryItems = [queryItem]
        
        if let url = urlComponents.url {
            performRequest(apiURL: url) { [weak self] (response: APIResponse?, error: Error?) -> Void in
                if (error != nil){
                    print(error)
                    completionHandler(error)
                } else {
                    self?.itemListResponse = response
                    completionHandler(nil)
                }
            }
        } else {
            completionHandler(UrlErrors.invalidUrl)
        }
    }
    
    func getItemDescriptionByIndex(index: Int, completionHandler: @escaping (ItemDescription?, Error?) -> Void) -> Void {
        
        var item: ItemDescription?

        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.mercadolibre.com"
        urlComponents.path = "/items/" + (itemListResponse?.results[index].id)! // Im always sure that if I loaded the table with info the user is going to select a valid row
        
        if let url = urlComponents.url {
            performRequest(apiURL: url) { (response: ItemAPIResponseModel?, error: Error?) -> Void in
                if (error != nil){
                    completionHandler(nil, error)
                } else {
                    var itemPictureArray = [String]()
                    for pic in response!.pictures{
                        itemPictureArray.append(pic.url)
                    }
                    item = ItemDescription (price: Double(response!.price),
                                            title: response!.title,
                                            pictures: itemPictureArray,
                                            soldQuantity: response!.soldQuantity,
                                            thumbnail: response!.thumbnail,
                                            availableItems: response!.availableQuantity)
                    completionHandler(item, nil)
                }
            }
        } else {
            completionHandler(nil, UrlErrors.invalidUrl)
        }
    }
    
    func emptyResults() -> Bool {
        return itemListResponse?.results.isEmpty ?? true
    }
    
    func numberOfItems() -> Int {
        return itemListResponse?.results.count ?? 0
    }
    
    func itemAt(index: Int) -> Item {
        var item = Item(price: 0, title: "", thumbnail: "Placeholder", freeShipping: false)
        if let resp = itemListResponse?.results[index] {
            item = Item(price: resp.price,
                        title: resp.title,
                        thumbnail: resp.thumbnail,
                        freeShipping: resp.shipping?.freeShipping ?? false)
        }
        return item
    }
    
    
    func performRequest<T>(apiURL: URL, completionHandler: @escaping (T?, Error?) -> Void) where T : Decodable, T : Encodable {

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
