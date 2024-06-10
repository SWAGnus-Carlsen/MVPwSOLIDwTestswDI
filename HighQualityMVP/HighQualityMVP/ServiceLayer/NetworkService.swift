//
//  NetworkService.swift
//  HighQualityMVP
//
//  Created by Vitaliy Halai on 10.06.24.
//

import Foundation

protocol NetworkServiceProtocol {
    func getComments(completion: @escaping (Result<[Comment], Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    
    func getComments(completion: @escaping (Result<[Comment], Error>) -> Void) {
        
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, _ in
            
            guard let data else {
                print("No data")
                return
            }
            print(data)
            do {
                let comments = try JSONDecoder().decode([Comment].self, from: data)
                print("Decoded successfully")
                completion(.success(comments))
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }
        
        }.resume()
    }
}
