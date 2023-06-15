//
//  MLGenericFeedbackScreen.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 12/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import UIKit

class MLGenericFeedbackScreenComponent: UIView {
    enum FeedbackCase {
        case miscError
        case itemNotFound
    }
    
    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()

    private lazy var feedbackImage: UIImageView = {
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
        label.numberOfLines = 2
        label.textColor = .intermediateGrey
        return label
    }()
    
    private lazy var errorSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir-Light", size: 16)
        label.textAlignment = .center
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
    
    var callback: (() -> ())?
    
    var type: FeedbackCase! {
        didSet {
            updateComponent()
        }
    }
    
    required convenience init(type: FeedbackCase, callback: @escaping () -> ()) {
        self.init(frame: .zero)
        self.type = type
        self.callback = callback
        updateComponent()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func initializeWithDataModel(_ model: MLGenericFeedbackModel) {
        self.errorTitle.text = model.title
        self.errorSubtitle.text = model.subtitle
        configureFeedbackImage(model.image)
        self.cta.setTitle(model.ctaTitle, for: .normal)
    }
    
    private func updateComponent() {
        let model = MLGenericFeedbackModelFactory().resolveFeedbackModel(forCase: type)
        initializeWithDataModel(model)
    }
    
    private func setupView() {
        backgroundColor = .softGrey
        
        addSubview(containerView)
        containerView.addSubview(feedbackImage)
        containerView.addSubview(errorTitle)
        containerView.addSubview(errorSubtitle)
        containerView.addSubview(cta)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 28),
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            feedbackImage.topAnchor.constraint(equalTo: containerView.topAnchor),
            feedbackImage.heightAnchor.constraint(equalTo: feedbackImage.widthAnchor),
            feedbackImage.widthAnchor.constraint(equalToConstant: 120),
            feedbackImage.leadingAnchor.constraint(greaterThanOrEqualTo: containerView.leadingAnchor, constant: 20),
            feedbackImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            errorTitle.topAnchor.constraint(equalTo: feedbackImage.bottomAnchor, constant: 28),
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
    
    private func configureFeedbackImage(_ image: UIImage) {
        let imageView = UIImageView(image: image)
        feedbackImage.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        feedbackImage.tintColor = .intermediateGrey
    }
    
    @objc private func onButtonTapped() {
        if let callback = callback {
            callback()
        }
    }
}
