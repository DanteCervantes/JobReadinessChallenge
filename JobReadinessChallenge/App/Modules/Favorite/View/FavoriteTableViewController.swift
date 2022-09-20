//
//  FavoriteTableViewController.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 20/09/22.
//

import UIKit

class FavoriteTableViewController: UITableViewController {
    
    private var favoritesViewModel: FavoritesViewModel!
    private var searchViewModel: SearchViewModel!
    private var detailViewModel: ProductDetailViewModel!
    private var favoriteItems = [ProductDetail]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        favoritesViewModel = FavoritesViewModel(service: SearchService())
        searchViewModel = SearchViewModel(service: SearchService())
        detailViewModel = ProductDetailViewModel()
        searchViewModel.delegate = self
        self.tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.cellId)
        getFavoritesItems()
    }
    #warning("Reload Table")
    
    //MARK: - SetupView
    private func setupView(){
        self.navigationItem.title = "Favoritos"
    }
    
    //MARK: -Functions
    private func getFavoritesItems(){
        DispatchQueue.main.async {
            self.favoritesViewModel.getProductDetail { product in
                self.favoriteItems = product
                self.tableView.reloadData()
            } onError: { error in
                self.didFailWithError(error: error)
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoriteItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.cellId, for: indexPath) as! ProductTableViewCell
        cell.showFavButton = false
        cell.product = self.favoriteItems[indexPath.item]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            let product = self.favoriteItems[indexPath.item]
            self.searchViewModel.getDescription(id: product.body.id) { description in
                product.body.description = description
                let vc = DetailViewController()
                vc.product = product
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            detailViewModel.deleteItemToFavorites(productId: self.favoriteItems[indexPath.item].body.id)
            self.favoriteItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
}

extension FavoriteTableViewController: SearchServiceDelegate {
    func didFailWithError(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            self.navigationController?.popToRootViewController(animated: true)
        }))
        self.present(alert, animated: true)
    }
}
