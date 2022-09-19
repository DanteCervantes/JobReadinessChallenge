//
//  SearchViewModel.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 13/09/22.
//

import Foundation
import UIKit

protocol SearchServiceDelegate {
    func didFailWithError(error: String)
}

class SearchViewModel {
    
    private let searchService: SearchService
    var delegate: SearchServiceDelegate?
    
    init(service: SearchService){
        self.searchService = service
    }
    
    func getProductsDetail(product: String, completition: @escaping ([ProductDetail]) -> Void){
        getCategoryId(product: product) { categoryId in
            self.getTopProducts(categoryId: categoryId) { topProducts in
                self.getProductsDetail(for: self.getIds(topProducts: topProducts)) { products in
                    completition(products)
                }
            }
        }
    }
    
    private func getCategoryId(product: String, completition: @escaping (String) -> Void){
        searchService.getCategory(product: product) { categoryId in
            guard categoryId != "Not Found" else {
                self.delegate?.didFailWithError(error: "Categoria no encontrada, por favor intente con una categoria distinta.")
                return
            }
            completition(categoryId)
        }
    }
    
    private func getTopProducts(categoryId: String, completition: @escaping (TopProducts) -> Void){
        searchService.getTopTwentyByCategory(categoryId: categoryId) { topProducts in
            let onlyItemProducts = topProducts.content.filter { product in
                product.type != "PRODUCT"
            }
            topProducts.content.removeAll()
            topProducts.content = onlyItemProducts
            completition(topProducts)
        }
    }
    
    private func getProductsDetail(for ids: String, completition: @escaping ([ProductDetail]) -> Void){
        searchService.getProductsDetail(ids: ids) { products in
            completition(products)
        }
    }
    
    func getDescription(id: String, completition: @escaping (String) -> Void){
        searchService.getProductDescription(product: id) { descripcion in
            completition(descripcion)
        }
    }
}

extension SearchViewModel {
    
    private func getIds(topProducts: TopProducts) -> String{
        var ids = ""
        for product in topProducts.content {
            ids += "\(product.id),"
        }
        return String(ids.trimmingCharacters(in: .whitespaces).dropLast())
    }
}
