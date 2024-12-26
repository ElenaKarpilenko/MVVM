//
//  WineService.swift
//  HW13
//
//  Created by Elena on 21/12/24.
//

import Foundation

class WineService {
    
    static let shared = WineService()
    
    private let baseURL = "https://api.sampleapis.com/wines/"
    
    func fetchWines(
        for wineType: String,
        completion: @escaping (Result<[Wine], Error>) -> Void) {
            // Determine endpoint based on wine type
            let endpoint: String
            switch wineType.lowercased() {
            case "красное":
                endpoint = "reds"
            case "белое":
                endpoint = "whites"
            case "мигреро":
                endpoint = "sparkling"
            case "розовое":
                endpoint = "rose"
            case "десерт":
                endpoint = "dessert"
            case "норесдан":
                endpoint = "port"
            default:
                completion(.failure(NSError(domain: "Invalid wine type", code: 0, userInfo: nil)))
                return
            }
            
            // Construct full URL
            guard let url = URL(string: baseURL + (endpoint)) else {
                completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            // Perform network request
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                    return
                }
                
                print("Request: \(url.absoluteString)")
                do {
                    // Decode JSON response
                    let wines = try JSONDecoder().decode([Wine].self, from: data)
                    completion(.success(wines))
                } catch let decodingError {
                    completion(.failure(decodingError))
                }
            }.resume()
        }
    
    func getWine(
        for wineID: Int,
        for wineType: String,
        completion: @escaping (Result<Wine, Error>) -> Void) {

            let endpoint: String
            switch wineType.lowercased() {
            case "красное":
                endpoint = "reds"
            case "белое":
                endpoint = "whites"
            case "мигреро":
                endpoint = "sparkling"
            case "розовое":
                endpoint = "rose"
            case "десерт":
                endpoint = "dessert"
            case "норесдан":
                endpoint = "port"
            default:
                completion(.failure(NSError(domain: "Invalid wine type", code: 0, userInfo: nil)))
                return
            }
            
            guard var url = URL(string: baseURL) else {
                completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
                return
            }
            
            url.append(path: "\(endpoint)")
            url.append(path: "\(wineID)")

            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            // Perform network request
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                    return
                }
                
                print("Request: \(url.absoluteString)")
                do {
                    // Decode JSON response
                    let wine = try JSONDecoder().decode(Wine.self, from: data)
                    completion(.success(wine))
                } catch let decodingError {
                    completion(.failure(decodingError))
                }
            }.resume()
        }
}
