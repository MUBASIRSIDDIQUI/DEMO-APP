//
//  GETVCViewModel.swift
//  DEMO APP
//
//  Created by Mubasir Siddiqui on 30/10/23.
//

import Foundation
import Combine



//By making the ViewModel conform to the 'ObservableObject' provided by the Combine framework 

class GETVCViewModel: ObservableObject {
    private let apiManager = APIManager.shared
    
    @Published var products: [Product] = []
    
    var cancellables: Set<AnyCancellable> = []
    
    func fetchProducts() {

        apiManager.fetchProducts(endpoint: Endpoint.getProduct) { result in
            switch result {
            case .success(let products):
                self.products = products
                print(products)
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }
}
