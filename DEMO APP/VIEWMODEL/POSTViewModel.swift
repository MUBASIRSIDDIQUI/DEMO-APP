//
//  POSTViewModel.swift
//  DEMO APP
//
//  Created by Mubasir Siddiqui on 30/10/23.
//

import Foundation

class POSTVCViewModel {
    private let apiManager = APIManager.shared
    
    func postProduct(product: PostProduct, completion: @escaping (Result<PostProduct, Error>) -> Void) {
        apiManager.postProduct(endpoint: .postProduct, method: .post, product: product) { result in
            completion(result)
        }
    }
}
