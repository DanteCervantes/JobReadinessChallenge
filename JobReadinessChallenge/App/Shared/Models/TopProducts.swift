//
//  TopProducts.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 13/09/22.
//

import Foundation

struct TopProducts: Codable {
    let content: [Content]
}

struct Content: Codable {
    let id: String
    let position: Int
    let type: String
}
