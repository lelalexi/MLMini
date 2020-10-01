//
//  SearchViewController.swift
//  MLMini
//
//  Created by Gaston Alexis Garcia Carli on 20/09/2019.
//  Copyright © 2019 ale. All rights reserved.
//

import UIKit

protocol SearchViewControllerProtocol: UIViewController {
    
    func configureView()
    func hideKeyboard()
    func pushNextViewController()
    func getSearchText() -> String
    func keyboardWillChange(notification: Notification)
}

class SearchViewController: UIViewController, SearchViewControllerProtocol {

    @IBOutlet var wallpaperImage: UIImageView!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    
    var presenter: SearchViewPresenterProtocol?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
            return .darkContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SearchViewPresenter()
        presenter?.view = self
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    deinit {
        presenter?.onViewDeInit()
    }
    
    func configureView() {
        searchButton.layer.cornerRadius = 8.0
        searchButton.backgroundColor = UIColor(named: "activeBlue")
        searchTextField.enablesReturnKeyAutomatically = true
        // TODO: Disable button if i have no text in the textfield
//        searchButton.isEnabled = false
    }
    
    func getSearchText() -> String {
        return searchTextField.text ?? ""
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        presenter?.onSearchButtonTap()
    }
    
    @IBAction func userDidTapView(_ sender: UITapGestureRecognizer) {
        presenter?.onUserViewTap()
    }
}

// MARK: - Navigation
extension SearchViewController {
    func pushNextViewController() {
        performSegue(withIdentifier: "pushToResultsTable", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pushToResultsTable" {
            if let resultTableviewViewController = segue.destination as? ProductListViewController{
                resultTableviewViewController.toSearch = searchTextField.text ?? ""
            }
        }
    }
}

// MARK: - UITextField and Keyboard Events
extension SearchViewController: UITextFieldDelegate {
    
    func keyboardWillChange(notification: Notification){
    //        We need to obtain the height of the keyboard
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        if notification.name == UIResponder.keyboardWillShowNotification || notification.name ==  UIResponder.keyboardWillChangeFrameNotification {
//            We need to do some math here and calculate the right displacement for Y axis
            let yDisplacement = abs(keyboardRect.origin.y - searchButton.frame.maxY)
            view.frame.origin.y = -yDisplacement - 16.0
        } else {
            view.frame.origin.y = 0.0
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        presenter?.onSearchButtonTap()
        return true
    }
    
    func hideKeyboard(){
        searchTextField.resignFirstResponder()
    }
}
