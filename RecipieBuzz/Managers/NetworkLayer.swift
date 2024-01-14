//
//  NetworkLayer.swift
//  RecipieBuzz
//
//  Created by Hitesh Suthar on 25/09/23.
//
import Alamofire
import AlamofireImage
import UIKit
class Network {
    private let APIKEY = "efa7fdea98b04835bab08e9ba40ac1f6"
    private let resultSize = 10
    var pageOffset = 0
    let decoder = JSONDecoder()
    private init() {}
    static let shared = Network()
    
    var fetching = false
    
    func getRandomRecepies(completion: @escaping (Result<Recipices, Error>) -> ())  -> () {
        // 'Result' is an Enum of Type <SuccessType, Error>
        // The type result escapes the function not the parameter name
        
        // In try catch
        // Try is inside the do block
        // Catch is outside of the do block
        
        let url = URL(string: "https://api.spoonacular.com/recipes/random?number=\(resultSize)&offset=\(pageOffset)")
        if let url = url {
            AF.request(url, method: .get, headers: HTTPHeaders(["x-api-key": APIKEY])).responseData { response in
                debugPrint("Request status code:", response.response?.statusCode as? Int ?? 0)
                guard let data = response.data else {
                    completion(.failure(NetworkError.emptyData))
                    return
                }
                do {
                    let recepies = try self.decoder.decode(Recipices.self, from: data)
                    completion(.success(recepies))
                }
                catch {
                    completion(.failure(error))
                }
            }
        } else {
            completion(.failure(URLError.invalidURL))
        }
    }
    
    func getRecipieImage(imageURL: String?, completion: @escaping (Result<UIImage, Error>) -> ()) {
        guard let imageURL = imageURL else  { print("invalid url")
            completion(.failure(URLError.invalidURL))
            return
        }
        
        AF.request(imageURL).responseImage { response in
            switch response.result {
            case .success(let image):
                completion(.success(image))
                print("image downloaded: \(image)")
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getRecipieInformation(for recipeID: Int, completion: @escaping (Result<RecipieInformation, Error>) -> ()) {
//    https://api.spoonacular.com/recipes/716429/information
        let url = URL(string: "https://api.spoonacular.com/recipes/\(recipeID)/information")
        if let url = url {
            AF.request(url, method: .get, headers: HTTPHeaders(["x-api-key": APIKEY])).responseData { response in
                debugPrint("Request status code:", response.response?.statusCode as? Int ?? 0)
                guard let data = response.data else {
                    completion(.failure(NetworkError.emptyData))
                    return
                }
                do {
                    let recepies = try self.decoder.decode(RecipieInformation.self, from: data)
                    completion(.success(recepies))
                }
                catch {
                    completion(.failure(error))
                }
            }
        } else {
            completion(.failure(URLError.invalidURL))
        }
    }
    
    func getRecipieInstructions(ofrecipieID recipieID: Int, completion: @escaping (Result<[RecipieInstruction], Error>) -> ()) {
        let url = URL(string: "https://api.spoonacular.com/recipes/\(recipieID)/analyzedInstructions")
        if let url = url {
            AF.request(url, method: .get, headers: HTTPHeaders(["x-api-key": APIKEY])).responseData { response in
                debugPrint("Request status code:", response.response?.statusCode as? Int ?? 0)
                guard let data = response.data else {
                    completion(.failure(NetworkError.emptyData))
                    return
                }
                data.printJSON()
                
                do {
                    
                    let recipieInstructionResponse = try self.decoder.decode([RecipieInstruction].self, from: data)
                    completion(.success(recipieInstructionResponse))
                } catch {
                    completion(.failure(error))
                }
            }
        } else {
            completion(.failure(URLError.invalidURL))
        }
    }
}
extension Data
{
    func printJSON()
    {
        if let JSONString = String(data: self, encoding: String.Encoding.utf8)
        {
            print(JSONString)
        }
    }
}
