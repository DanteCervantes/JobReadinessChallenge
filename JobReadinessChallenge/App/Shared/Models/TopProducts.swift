//
//  TopProducts.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 13/09/22.
//

import Foundation

class TopProducts: Codable {
    var content: [Content]
}

class Content: Codable {
    let id: String
    let position: Int
    let type: String
}
