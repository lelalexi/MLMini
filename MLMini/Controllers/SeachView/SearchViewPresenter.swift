//
//  SearchViewPresenter.swift
//  MLMini
//
//  Created by Alexis Garcia on 30/09/2020.
//  Copyright © 2020 ale. All rights reserved.
//

import Foundation
import UIKit

protocol SearchViewPresenterProtocol: class {
    
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
//        We need to obtain the height of the keyboard
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        if notification.name == UIResponder.keyboardWillShowNotification || notification.name ==  UIResponder.keyboardWillChangeFrameNotification {
//            We need to do some math here and calculate the right displacement for Y axis
            let yDisplacement = abs(keyboardRect.origin.y - (view?.getButtonBottomPosition())!)
            view?.setViewYOffset(offset: -yDisplacement - 16.0)
        } else {
            view?.setViewYOffset(offset: 0.0)
        }
    }
    
    private func removeObservers(){
//        Stop listening keyboard events
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
}
