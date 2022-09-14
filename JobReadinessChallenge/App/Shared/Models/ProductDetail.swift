//
//  ProductDetail.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 14/09/22.
//

import Foundation

struct ProductDetail: Codable {
    let body: Body
}

struct Body: Codable {
    let id: String
    let title: String
    let price: Double
    let secure_thumbnail: String
}

