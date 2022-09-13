//
//  CategoriesService.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 13/09/22.
//

import Foundation

struct CategoriesService {
    
    var categories: [Category] = [Category(title: "Automoviles", imageName: "car"), Category(title: "Motos", imageName: "motorcycle"), Category(title: "Camiones", imageName: "truck-fill"), Category(title: "Inmuebles", imageName: "houses"), Category(title: "Ver más", imageName: "plus")]
    
    func getCategoriesCount() -> Int {
        return categories.count
    }
}
