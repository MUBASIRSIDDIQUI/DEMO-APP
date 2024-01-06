//
//  APIManager.swift
//  DEMO APP
//
//  Created by Mubasir Siddiqui on 26/10/23.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
    // Defining the base URL for the API  
    
    
    // POST Request
    
    func postProduct(endpoint: Endpoint, method: HTTPMethod, product: PostProduct, completion: @escaping (Result<PostProduct, Error>) -> Void) {
        
        let postURL = endpoint.url
        
        var request = URLRequest(url: postURL)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(product)
            request.httpBody = jsonData
        } catch {
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let responseProduct = try decoder.decode(PostProduct.self, from: data)
                    completion(.success(responseProduct))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
    
    //GET Request
    
    func fetchProducts(endpoint:Endpoint, completion: @escaping (Result<[Product], Error>) -> Void) {
        let getURL = endpoint.url
        
        URLSession.shared.dataTask(with: getURL) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let responseData = try JSONDecoder().decode(ResponseData.self, from: data)
                    completion(.success(responseData.products))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}

 // Enum to specify different endpoints

let baseURL = "https://dummyjson.com"

enum Endpoint {
    

    case getProduct
    case postProduct
    
    var path: String {
        switch self {
        case .getProduct:
            return "/products"
        case .postProduct:
            return "/products/add"
        }
    }
    var url: URL{
        return URL(string: "\(baseURL)\(path)")!
   }
}


// HTTP method Enum

enum HTTPMethod: String{
    case get = "GET"
    case post = "POST"
}

enum APIRequestData {
    case getProduct(product: Product)
    case postProduct(product: PostProduct)
}


typealias ResultHandler<T> = (Result<T, DataError>) -> Void





enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
    case decoding(Error?)
}



