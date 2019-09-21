//
//  ViewController.swift
//  MLMini
//
//  Created by Gaston Alexis Garcia Carli on 20/09/2019.
//  Copyright © 2019 ale. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet var productTableView: UITableView!
    @IBOutlet var noResultsFoundView: UIView!
    
    var apiResp: APIResponse?
    var service: APIServiceProtocol!
    
    var toSearch: String! = ""
    
    var url = "https://api.mercadolibre.com/sites/MLA/search?q=Motorola%20G6"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noResultsFoundView.layer.cornerRadius = noResultsFoundView.frame.height / 2
        noResultsFoundView.clipsToBounds = true
        
        registerTableCells()
        service = MercadolibreService()
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.mercadolibre.com"
        urlComponents.path = "/sites/MLA/search"
        let queryItem = URLQueryItem(name: "q", value: toSearch)
        urlComponents.queryItems = [queryItem]
        var wawa = urlComponents.url
//        service.performItemSearchByName(apiURL: (wawa)!) { [weak self] (response: APIResponse?, error: Error?) -> Void in
//            self?.apiResp = response
//            if self?.apiResp?.results.count == 0 {
//                self?.showEmptyView()
//            } else {
//                self?.reloadView()
//
//            }
//        }
        service.getItemsByName(name: toSearch) { [weak self] (error: Error?) in
            if error != nil {
//                TODO: DO SOMETHING WITH THE ERROR 
                print("Error in getItemsByName")
                return
            }
            
            if self?.service.emptyResults() ?? false {
                self?.showEmptyView()
            } else {
                self?.reloadView()
            }
                
        }
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func registerTableCells(){
        let productCell = UINib(nibName: "ProductViewCell", bundle: nil)
        productTableView.register(productCell, forCellReuseIdentifier: "ProductViewCell")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return apiResp?.results.count ?? 0
        return service.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = productTableView.dequeueReusableCell(withIdentifier: "ProductViewCell", for: indexPath) as? ProductViewCell else { return UITableViewCell() }
//        let result = apiResp?.results[indexPath.row]
//        cell.productTitle.text = result?.title
//        //        TODO: corregir el force unwrap
//        cell.productImage.sd_setImage(with: URL(string: result!.thumbnail), placeholderImage: UIImage(named: "Placeholder"))
//        cell.productPrice.text = "$ " + String(result!.price.formattedWithSeparator)
        let item = service.itemAt(index: indexPath.row)
        cell.configureCell(item: item)
        return cell
    }
}


extension ViewController: ProductProtocol {
    func reloadView() {
        DispatchQueue.main.async {
            self.productTableView.reloadData()
        }
    }
    
    func showEmptyView() {
        DispatchQueue.main.async {
            self.productTableView.isHidden = true
        }
    }
}

protocol  ProductProtocol {
    
    func reloadView()
    
    func showEmptyView()
}

