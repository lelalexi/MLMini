//
//  ProductListViewController.swift
//  MLMini
//
//  Created by Gaston Alexis Garcia Carli on 20/09/2019.
//  Copyright © 2019 ale. All rights reserved.
//

import UIKit
import SDWebImage

class ProductListViewController: UIViewController {
    
    @IBOutlet var productTableView: UITableView!
    @IBOutlet var noResultsIconView: UIView!
    @IBOutlet var noResultsView: UIView!
    
    var spinner = SpinnerViewController()
    var apiResp: APIResponseModel?
    var service: APIServiceProtocol!
    var toSearch = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeNoResultsFoundView()
        initializeProductTableView()
        createSpinnerView()
    }
    
    private func initializeNoResultsFoundView(){
        noResultsView.isHidden = true
        noResultsIconView.layer.cornerRadius = noResultsIconView.frame.height / 2
        noResultsIconView.clipsToBounds = true
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProductDetail" {
            if let detailProductViewController = segue.destination as? ProductDetailViewController, let index = sender as? IndexPath{
                detailProductViewController.service = service
                detailProductViewController.itemIndexPath = index
                print("pase por el segue \(index)")
            }
        }
    }
    func createSpinnerView() {
        // Add a little spinning wheel on the status bar to show that there is something happening at backgorund
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        // add the spinner to the view
        addChild(spinner)
        spinner.view.frame = view.frame
        view.addSubview(spinner.view)
        spinner.didMove(toParent: self)

    }
    
    func removeSpinnerView() {
        // Remove the little spinning wheel on the status bar
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        // remove the spinner from the view
        self.spinner.willMove(toParent: nil)
        self.spinner.view.removeFromSuperview()
        self.spinner.removeFromParent()
    }
}

// MARK: - TableView
extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func initializeProductTableView(){
        productTableView.isHidden = true
        registerTableCells()
        //Set tableview automatic row heigth to true
        productTableView.rowHeight = UITableView.automaticDimension
        productTableView.estimatedRowHeight = 140
        loadData()
        
    }
    
    private func registerTableCells(){
        let productCell = UINib(nibName: "ProductViewCell", bundle: nil)
        productTableView.register(productCell, forCellReuseIdentifier: "ProductViewCell")
    }
    
//    here Im going to load data from the adapter
    private func loadData(){
        
        service = MercadolibreService()
        
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return service.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = productTableView.dequeueReusableCell(withIdentifier: "ProductViewCell", for: indexPath) as? ProductViewCell else { return UITableViewCell() }
        let item = service.itemAt(index: indexPath.row)
        cell.configureCell(item: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toProductDetail", sender: indexPath)
    }
}

// MARK: - Protocols
protocol  ProductProtocol {
    
    //Access the main thread and updates the tableview
    func reloadView()
    
    //Hides the tableview in order to see a view saying that there re no results available
    func showEmptyView()
}

extension ProductListViewController: ProductProtocol {
    func reloadView() {
        DispatchQueue.main.async {
            self.removeSpinnerView()
            self.productTableView.isHidden = false
            self.productTableView.reloadData()
        }
    }
    
    func showEmptyView() {
        DispatchQueue.main.async {
            self.removeSpinnerView()
            self.noResultsView.isHidden = false
        }
    }
}



