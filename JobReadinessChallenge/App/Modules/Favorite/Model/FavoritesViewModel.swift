//
//  FavoritesViewModel.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 20/09/22.
//

import Foundation

//
//  ProductDetailViewModel.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 20/09/22.
//

import Foundation

class FavoritesViewModel {
    
    private let searchService: SearchService
    private let userDefaults = UserDefaults()
    private let favoriteItemsKey = "favItems"
    private var favoriteProducts: [String]?
    
    init(service: SearchService){
        favoriteProducts = userDefaults.value(forKey: favoriteItemsKey) as? [String]
        self.searchService = service
    }
    
    func getProductDetail(completition: @escaping([ProductDetail]) -> Void, onError: @escaping (String) -> Void){
        searchService.getProductsDetail(ids: getIds(favoriteItems: favoriteProducts!)) { products in
            completition(products)
        } onError: { error in
            onError(error)
        }
    }
    
    private func getIds(favoriteItems: [String]) -> String{
        var ids = ""
        for product in favoriteItems {
            ids += "\(product),"
        }
        return String(ids.trimmingCharacters(in: .whitespaces).dropLast())
    }
}

