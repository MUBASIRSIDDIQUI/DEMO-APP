//
//  POSTModel.swift
//  DEMO APP
//
//  Created by Mubasir Siddiqui on 30/10/23.
//

import Foundation

struct PostProduct: Codable {
    let id: Int 
    let title: String
    let category: String
    let price: Int

    // Make it optional
//    let description: String?
//    let discountPercentage: Double?
//    let rating: Double?
//    let stock: Int?
//    let brand: String?
//    let thumbnail: String?
//    let images: [String]?
}
