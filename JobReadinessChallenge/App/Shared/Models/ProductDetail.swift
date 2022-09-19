//
//  ProductDetail.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 14/09/22.
//

import Foundation

class ProductDetail: Codable {
    var body: Body
}

class Body: Codable {
    let id: String
    let title: String
    let price: Double
    let secure_thumbnail: String
    var description: String?
    let pictures: [Image]
}

class Image: Codable {
    let secure_url: String
}

