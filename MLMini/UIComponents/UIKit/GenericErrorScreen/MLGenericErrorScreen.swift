//
//  MLGenericErrorScreen.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 12/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import UIKit


class MLGenericErrorScreen: UIView {
    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()

    private lazy var errorImage: UIImageView = {
        let image = MLImage.damagedPackage
        let imageView = UIImageView(image: image)
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .intermediateGrey
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var errorTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Heavy", size: 28)
        label.textAlignment = .center
        label.text = "Oops!"
        label.numberOfLines = 2
        label.textColor = .intermediateGrey
        return label
    }()
    
    private lazy var errorSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Light", size: 16)
        label.textAlignment = .center
        label.text = "Something went wrong, try again later or in a couple of minutes"
        label.numberOfLines = 3
        label.textColor = .intermediateGrey
        return label
    }()
    
    private lazy var cta: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Retry", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.activeBlue, for: .normal)
        button.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    private var ctaAction: (() -> ())!
    
    required convenience init(ctaAction: @escaping () -> ()) {
        self.init(frame: .zero)
        self.ctaAction = ctaAction
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func setupView() {
        backgroundColor = .softGrey
        
        addSubview(containerView)
        containerView.addSubview(errorImage)
        containerView.addSubview(errorTitle)
        containerView.addSubview(errorSubtitle)
        containerView.addSubview(cta)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 20),
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            errorImage.topAnchor.constraint(equalTo: containerView.topAnchor),
            errorImage.heightAnchor.constraint(equalTo: errorImage.widthAnchor),
            errorImage.widthAnchor.constraint(equalToConstant: 120),
            errorImage.leadingAnchor.constraint(greaterThanOrEqualTo: containerView.leadingAnchor, constant: 20),
            errorImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            errorTitle.topAnchor.constraint(equalTo: errorImage.bottomAnchor, constant: 28),
            errorTitle.leadingAnchor.constraint(greaterThanOrEqualTo: containerView.leadingAnchor),
            errorTitle.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            errorSubtitle.topAnchor.constraint(equalTo: errorTitle.bottomAnchor, constant: 20),
            errorSubtitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            errorSubtitle.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            cta.topAnchor.constraint(equalTo: errorSubtitle.bottomAnchor, constant: 20),
            cta.leadingAnchor.constraint(greaterThanOrEqualTo: containerView.leadingAnchor),
            cta.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            cta.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    @objc private func onButtonTapped() {
        ctaAction()
    }
}
