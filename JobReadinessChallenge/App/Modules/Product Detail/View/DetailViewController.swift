//
//  DetailViewController.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 15/09/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    private lazy var backButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(named: "back-button")
        button.tintColor = .black
        button.target = self
        button.action = #selector(backButtonPressed)
        return button
    }()
    
    private lazy var cartButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(named: "Cart Icon")
        button.tintColor = .black
        return button
    }()
    
    private lazy var findButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "magnifyingglass")
        button.tintColor = .black
        return button
    }()
    
    private lazy var heartButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.tintColor = .black
        button.target = self
        button.action = #selector(favoriteButtonPressed)
        return button
    }()
    
    private lazy var detailView: DetailView = {
        let detailView = DetailView()
        detailView.translatesAutoresizingMaskIntoConstraints = false
        return detailView
    }()
    
    var product: ProductDetail? {
        didSet {
            detailView.product = product!
        }
    }
    
    private var viewModel: ProductDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
        setupConstraints()
        viewModel = ProductDetailViewModel()
        detailView.delegate = self
        toggleFavButton()
    }
    
    //MARK: - Setup View
    private func setupView(){
        view.addSubview(detailView)
        self.view.backgroundColor = .white
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    private func setupNavigationBar(){
        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItems = [cartButton, findButton, heartButton]
    }
    
    //MARK: - Functions
    @objc private func backButtonPressed(){
        navigationController?.popViewController(animated: true)
    }
    
    private func toggleFavButton(){
        if viewModel.isFavoriteItem(productId: (product?.body.id)!){
            heartButton.image = UIImage(systemName: "heart.fill")
            detailView.favoriteButton.configuration?.image = UIImage(systemName: "heart.fill")
        } else {
            heartButton.image = UIImage(systemName: "heart")
            detailView.favoriteButton.configuration?.image = UIImage(systemName: "heart")
        }
    }
        
    @objc private func favoriteButtonPressed(){
        guard let productId = product?.body.id else { return }
        
        if viewModel.isFavoriteItem(productId: productId) {
            viewModel.deleteItemToFavorites(productId: productId)
        } else {
            viewModel.addItemToFavorites(productId: productId)
        }
        toggleFavButton()
    }
}

extension DetailViewController: DetailViewDelegate {
    func favPressed() {
        favoriteButtonPressed()
    }
}
