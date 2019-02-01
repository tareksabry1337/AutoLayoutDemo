//
//  RegistrationView.swift
//  AutoLayout
//
//  Created by Vortex on 2/1/19.
//  Copyright © 2019 Tarek Sabry. All rights reserved.
//

import UIKit

@objc protocol RegistrationViewDelegate: class {
    @objc func imageViewTapped()
    @objc func registerButtonTapped()
}

class RegistrationView: UIView {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var tapGesture: UITapGestureRecognizer = {
        let tapGesture = UITapGestureRecognizer(target: delegate, action: #selector(delegate.imageViewTapped))
        return tapGesture
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.layer.cornerRadius = 50
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.borderStyle = .roundedRect
        textField.tintColor = .red
        textField.placeholder = "Username"
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.borderStyle = .roundedRect
        textField.tintColor = .red
        textField.placeholder = "Password"
        return textField
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.titleLabel?.textColor = .white
        button.setTitle("Register", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(delegate, action: #selector(delegate.registerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var username: String {
        return usernameTextField.text!
    }
    
    var password: String {
        return passwordTextField.text!
    }
    
    private weak var delegate: RegistrationViewDelegate!
    
    
    init(delegate: RegistrationViewDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        layoutUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(profileImageView)
        containerView.addSubview(usernameTextField)
        containerView.addSubview(passwordTextField)
        containerView.addSubview(registerButton)
    }
    
    private func setupScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func setupContainerViewConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1)
        ])
    }
    
    private func setupProfileImageViewConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            profileImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 100),
            profileImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupUsernameTextFieldConstraints() {
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8),
            usernameTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            usernameTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8)
        ])
    }
    
    private func setupPasswordTextFieldConstraints() {
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            passwordTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8)
        ])
    }
    
    private func setupRegisterButtonConstraints() {
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8),
            registerButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1/2),
            registerButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            registerButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
    }
    
    private func layoutUI() {
        addSubviews()
        setupScrollViewConstraints()
        setupContainerViewConstraints()
        setupProfileImageViewConstraints()
        setupUsernameTextFieldConstraints()
        setupPasswordTextFieldConstraints()
        setupRegisterButtonConstraints()
    }
    
}
