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
        
//        searchButton.isEnabled = false
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        hideKeyboard()
    }
    
    @IBAction func userDidTapView(_ sender: UITapGestureRecognizer) {
        hideKeyboard()
    }
    
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pushToResultsTable" {
            if let resultTableviewViewController = segue.destination as? ViewController{
//                guard let fila = sender as? HeroTableViewCell else {return}
//                //HE.hero = heroes[tableView.indexPath(for: fila)!.row]
//                HE.detailViewModel = viewModel.generateDetailMVIntance(index: tableView.indexPath(for: fila)!.row)
                resultTableviewViewController.toSearch = searchTextField.text
            }
            print("Pase por el segue")
        }
    }
 

}

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
        return true
    }
    
    func hideKeyboard(){
        searchTextField.resignFirstResponder()
    }
}
