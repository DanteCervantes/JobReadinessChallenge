//
//  SearchTableViewController.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 13/09/22.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    private lazy var cartButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(named: "Cart Icon")
        button.tintColor = .black
        return button
    }()
    
    private lazy var backButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(named: "back-button")
        button.tintColor = .black
        button.target = self
        button.action = #selector(backButtonPressed)
        return button
    }()
    
    private var viewModel: SearchViewModel!
    private var products = [ProductDetail]()
    
    private let searchBar = UISearchBar()
    var searchText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        setupSearchBar()
        searchBar.text = searchText
        self.viewModel = SearchViewModel(service: SearchService())
        self.viewModel.delegate = self
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.cellId)
        getProducts()
    }
    
    //MARK: - Functions
    private func getProducts(){
        DispatchQueue.main.async {
            self.viewModel.getProductsDetail(product: self.searchText!) { products in
                self.products = products
                self.tableView.reloadData()
            } onError: { error in
                self.didFailWithError(error: error)
            }
        }
    }
    
    @objc private func backButtonPressed(){
        navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.cellId, for: indexPath) as! ProductTableViewCell
        let currentItem = products[indexPath.row]
        cell.product = currentItem
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            let product = self.products[indexPath.item]
            self.viewModel.getDescription(id: product.body.id) { description in
                product.body.description = description
                let vc = DetailViewController()
                vc.product = product
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

extension SearchTableViewController: UISearchBarDelegate {
    
    private func setupSearchBar(){
        navigationItem.titleView = searchBar
        navigationItem.rightBarButtonItem = cartButton
        navigationItem.leftBarButtonItem = backButton
        searchBar.placeholder = "Buscar en Mercado Libre"
        searchBar.searchTextField.font = .proximaNova14
        searchBar.searchTextField.backgroundColor = .white
        searchBar.sizeToFit()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchText = searchBar.text?.trimmingCharacters(in: .whitespaces)
        guard searchText?.count ?? 0 > 0 else {
            let alert = UIAlertController(title: "Advertencia", message: "Por favor ingrese algún valor en el campo de busqueda.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true)
            return
        }
        
        products = []
        tableView.reloadData()
        getProducts()
    }
}
extension SearchTableViewController: SearchServiceDelegate {
    func didFailWithError(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.navigationController?.popToRootViewController(animated: true)
        }))
        self.present(alert, animated: true)
    }
}
