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
    
    private lazy var mainView: MainView = {
       let mainView = MainView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextfiled.delegate = self
        setupView()
        setupConstraints()
    }
    
    private func setupView(){
        self.view.addSubview(statusBar)
        self.view.addSubview(mainView)
        self.navigationItem.titleView = searchTextfiled
        self.navigationItem.rightBarButtonItem = cartIcon
        self.view.backgroundColor = .appBackground
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            statusBar.widthAnchor.constraint(equalTo: view.widthAnchor),
            statusBar.heightAnchor.constraint(equalToConstant: 20),
            mainView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        ])
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
}

extension MainViewController: UITextFieldDelegate{

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let searchText = searchTextfiled.text, !searchText.isEmpty else {
            let alert = UIAlertController(title: "Advertencia", message: "Por favor ingrese algún valor en el campo de busqueda.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true)
            return false
        }
        
        let searchVC = SearchTableViewController()
        searchVC.searchText = searchText
        self.navigationController?.pushViewController(searchVC, animated: true)
        
        return true
    }
}
