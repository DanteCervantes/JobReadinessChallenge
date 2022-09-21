//
//  ProductDetailViewModel.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 20/09/22.
//

import Foundation

class ProductDetailViewModel {
    
    private var favoriteProducts: [String]?
    private let defaultKey = "favoriteProducts"
    private var  defaults = UserDefaults.standard.array(forKey: "favoriteProducts") as? [String]
    
    init(){
        favoriteProducts = defaults
    }
    
    func isFavoriteItem(productId: String) -> Bool {
        guard let items = favoriteProducts else {
            return false
        }
        return items.contains(productId)
    }
    
    func addItemToFavorites(productId: String){
        favoriteProducts?.append(productId)
        UserDefaults.standard.set(favoriteProducts, forKey: defaultKey)
    }
    
    func deleteItemToFavorites(productId: String) {
        let itemIndex = favoriteProducts?.firstIndex(of: productId)
        favoriteProducts?.remove(at: itemIndex!)
        UserDefaults.standard.set(favoriteProducts, forKey: defaultKey)
    }
}

