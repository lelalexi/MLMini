//
//  SearchViewController.swift
//  MLMini
//
//  Created by Gaston Alexis Garcia Carli on 20/09/2019.
//  Copyright © 2019 ale. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet var wallpaperImage: UIImageView!
    @IBOutlet var wallpaperImageTopConstraint: NSLayoutConstraint!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addObservers()
        configureView()

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
        removeObservers()
    }
    
    fileprivate func configureView() {
        
        searchButton.layer.cornerRadius = 8.0
        searchButton.backgroundColor = .activeBlue
        searchTextField.enablesReturnKeyAutomatically = true
        // TODO: Disable button if i have no text in the textfield
//        searchButton.isEnabled = false
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        hideKeyboard()
        if searchTextField.text != "" {
            performSegue(withIdentifier: "pushToResultsTable", sender: nil)
        }
    }
    
    @IBAction func userDidTapView(_ sender: UITapGestureRecognizer) {
        hideKeyboard()
    }
    
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pushToResultsTable" {
            if let resultTableviewViewController = segue.destination as? ProductListViewController{
                resultTableviewViewController.toSearch = searchTextField.text
            }
        }
    }
 

}

// MARK: - UITextField and Keyboard Events
extension SearchViewController: UITextFieldDelegate {
    
    private func addObservers(){
//        Start listening keyboard events
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    private func removeObservers(){
//        Stop listening keyboard events
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboardWillChange(notification: Notification){
//        We need to obtain the height of the keyboard
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        if notification.name == UIResponder.keyboardWillShowNotification || notification.name ==  UIResponder.keyboardWillChangeFrameNotification {
//            We need to do some math here and calculate the right displacement for y axis
            let yDisplacement = abs(keyboardRect.origin.y - searchButton.frame.maxY)
            view.frame.origin.y = -yDisplacement
        } else {
            view.frame.origin.y = 0
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        if textField.text != "" {
            performSegue(withIdentifier: "pushToResultsTable", sender: nil)
        }
        return true
    }
    
    func hideKeyboard(){
        searchTextField.resignFirstResponder()
    }
}
