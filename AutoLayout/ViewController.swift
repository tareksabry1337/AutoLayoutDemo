//
//  ViewController.swift
//  AutoLayout
//
//  Created by Vortex on 1/26/19.
//  Copyright © 2019 Tarek Sabry. All rights reserved.
//

import UIKit

class ViewController: UIViewController, RegistrationViewDelegate {
    
    lazy var mainView: RegistrationView = {
        let view = RegistrationView(delegate: self)
        view.backgroundColor = .white
        return view
    }()
    
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func registerButtonTapped() {
        print(mainView.username)
        print(mainView.password)
    }
    
    func imageViewTapped() {
        print("ImageView was tapped")
    }
}

