//
//  GETModel.swift
//  DEMO APP
//
//  Created by Mubasir Siddiqui on 25/10/23.
//

//import UIKit
import Foundation

//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//
//
//}



//struct baseURL {
//    let url = URL(string: "" )
//    
//}
//
struct Product: Codable {
    
    let id: Int?
    let title: String?
    let description: String?
    let price: Int?
    let discountPercentage, rating: Double?
    let stock: Int?
    let brand: String?
    let category: String
    let thumbnail: String?
    let images: [String]?
}


struct ResponseData: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

