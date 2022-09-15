//
//  MainViewController.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 12/09/22.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var cartButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(named: "Cart Icon")
        button.tintColor = .black
        return button
    }()
    
    private lazy var mainView: MainView = {
        let mainView = MainView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
    
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        setupView()
        setupConstraints()
        setupSearchBar()
    }
    
    private func setupView(){
        self.view.addSubview(mainView)
        self.view.backgroundColor = .appBackground
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        ])
    }
}

extension MainViewController: UISearchBarDelegate {
    
    private func setupSearchBar(){
        navigationItem.titleView = searchBar
        searchBar.placeholder = "Buscar en Mercado Libre"
        searchBar.searchTextField.font = .proximaNova14
        searchBar.searchTextField.backgroundColor = .white
        navigationItem.rightBarButtonItem = cartButton
        searchBar.sizeToFit()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let searchText = searchBar.text?.trimmingCharacters(in: .whitespaces)
        
        guard searchText?.count ?? 0 > 0 else {
            let alert = UIAlertController(title: "Advertencia", message: "Por favor ingrese algún valor en el campo de busqueda.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true)
            return
        }
        
        let searchVC = SearchTableViewController()
        searchVC.searchText = searchText
        navigationController?.pushViewController(searchVC, animated: true)
        searchBar.text = ""
    }
}
