//
//  NetworkLayer.swift
//  RecepieApp
//
//  Created by Hitesh Suthar on 25/09/23.
//
import Foundation
class Network {
    private let APIKEY = "efa7fdea98b04835bab08e9ba40ac1f6"
    private let resultSize = 10
    private init() {
        
    }
    static let shared = Network()
    
    func getRandomRecepies(completion: @escaping (Result<Recipices, Error>) -> ())  -> () {
        
        // 'Result' is an Enum of Type <SuccessType, Error>
        // The type result escapes the function not the parameter name
        
        // In try catch
        // Try is inside the do block
        // Catch is outside of the do block
        
        let url = URL(string: "https://api.spoonacular.com/recipes/random?number=\(resultSize)")
        if let url = url {
            var request = URLRequest(url: url,timeoutInterval: 10)
            request.setValue(APIKEY, forHTTPHeaderField: "x-api-key")
            let task = URLSession.shared.dataTask(with: request) { data, URLResponse, error in
                let decoder = JSONDecoder()
                guard let data = data else {
                    completion(.failure(NetworkError.emptyData))
                    return }
                do {
                    let recepies = try decoder.decode(Recipices.self, from: data)
                    completion(.success(recepies))
                }
                catch {
                    completion(.failure(error))
                }
            }
            task.resume()
        } else {
            print(URLError.invalidURL)
        }
    }
}
