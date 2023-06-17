//
//  SearchViewPresenter.swift
//  MLMini
//
//  Created by Alexis Garcia on 30/09/2020.
//  Copyright © 2020 ale. All rights reserved.
//

import Foundation
import UIKit

protocol SearchViewPresenterProtocol: AnyObject {
    
    var view: SearchViewControllerProtocol? { get set }
    func viewDidLoad()
    func onViewDeInit()
    func onUserViewTap()
    func onSearchButtonTap()
}

class SearchViewPresenter: SearchViewPresenterProtocol {
    
    weak var view: SearchViewControllerProtocol?
    
    //MARK: - Initializers
    required init() { }
    
    func viewDidLoad() {
        addObservers()
        view?.configureView()
    }
    
    func onUserViewTap() {
        view?.hideKeyboard()
    }
    
    func onSearchButtonTap() {
        guard let view = view else { return }
        view.hideKeyboard()
        if (!(view.getSearchText().isEmpty)){
         view.pushNextViewController()
        }
    }
    
    func onViewDeInit() {
        removeObservers()
    }
}

//MARK: - Observers
extension SearchViewPresenter {
    private func addObservers(){
//        Start listening keyboard events
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboardWillChange(notification: Notification){
        view?.keyboardWillChange(notification: notification)
    }
    
    private func removeObservers(){
//        Stop listening keyboard events
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
}
