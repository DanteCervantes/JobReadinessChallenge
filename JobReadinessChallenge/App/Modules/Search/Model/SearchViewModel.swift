//
//  SearchViewModel.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 13/09/22.
//

import Foundation

class SearchViewModel {
    
    private let productService: ProductService
    
    init(service: ProductService){
        self.productService = service
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
        productService.getCategory(product: product) { categoryId in
            guard categoryId != "Not Found" else {
                //TODO: manejar error en UI
                print("Producto no encontrado")
                return
            }
            completition(categoryId)
        }
    }
    
    private func getTopProducts(categoryId: String, completition: @escaping (TopProducts) -> Void){
        productService.getTopTwentyByCategory(categoryId: categoryId) { topProducts in
            completition(topProducts)
        }
    }
    
    private func getProductsDetail(for ids: String, completition: @escaping ([ProductDetail]) -> Void){
        productService.getProductsDetail(ids: ids) { products in
            completition(products)
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
