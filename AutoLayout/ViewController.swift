//
//  ViewController.swift
//  AutoLayout
//
//  Created by Vortex on 1/26/19.
//  Copyright © 2019 Tarek Sabry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var mainView: UIView = {
        let view = UIView(frame: self.view.frame)
        view.backgroundColor = .white
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.borderStyle = .roundedRect
        textField.tintColor = .red
        textField.placeholder = "Username"
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.borderStyle = .roundedRect
        textField.tintColor = .red
        textField.placeholder = "Password"
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.titleLabel?.textColor = .white
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var loginButton2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.titleLabel?.textColor = .white
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(usernameTextField)
        containerView.addSubview(passwordTextField)
        containerView.addSubview(loginButton)
        containerView.addSubview(loginButton2)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            usernameTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            usernameTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8)
        ])
        
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            passwordTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8),
            loginButton.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1/2),
            loginButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            loginButton2.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 1000),
            loginButton2.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1/2),
            loginButton2.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            loginButton2.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
    }
    
    
}

