//
//  EndPoints.swift
//  DEMO APP
//
//  Created by Mubasir Siddiqui on 31/10/23.
//

import Foundation


protocol EndPointType {
    var path: String {get}
    var baseURL: String {get}
    var url: URL? {get}
    var method: HTTPMethod {get}
    var body:Encodable? {get}
    var headers: [String:String]? {get}
}

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

enum ProductEndPoint {
    case products // Module - GET
    case addProduct(product: PostProduct) // POST
}

extension ProductEndPoint: EndPointType {
    var baseURL: String {
        return "https://dummyjson.com/"
    }
    
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")

    }
    
    var method: HTTPMethod {
        switch self {
        case .products:
            return .get
        case .addProduct:
            return .post
        }
    }
    
    var body: Encodable? {
        switch self {
        case .products:
            return nil
        case .addProduct(let product):
            return product
        }
    }
    
    var headers: [String : String]? {
        ProductEndPoint.commonHeaders

    }
    
    static var commonHeaders: [String: String] {
        return [
            "Content-Type": "application/json"
        ]
    }
    
    
    var path: String {
        switch self {
        case .products:
            return "products"
        case .addProduct:
            return "products/add"
        }
    }
}
