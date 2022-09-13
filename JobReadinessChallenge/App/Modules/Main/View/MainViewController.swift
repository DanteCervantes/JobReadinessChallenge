//
//  MainViewController.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 12/09/22.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var searchTextfiled: SearchTextField = {
        let textField = SearchTextField()
        textField.placeholder = "Buscar en Mercado Libre"
        textField.icon = UIImage(systemName: "magnifyingglass")
        textField.iconColor = .gray
        return textField
    }()
    
    private lazy var cartIcon: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(named: "Cart Icon")
        button.tintColor = .black
        return button
    }()
    
    private lazy var statusBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .mlYellow
        return view
    }()
    
    private lazy var locationView: LocationView = {
        let view = LocationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    private func setupView(){
        self.view.addSubview(statusBar)
        self.view.addSubview(locationView)
        self.view.backgroundColor = .white
        self.navigationItem.titleView = searchTextfiled
        self.navigationItem.rightBarButtonItem = cartIcon
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            statusBar.widthAnchor.constraint(equalTo: view.widthAnchor),
            statusBar.heightAnchor.constraint(equalToConstant: 20),
            locationView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            locationView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
        ])
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
}