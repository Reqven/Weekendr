//
//  NetworkManager.swift
//  Weekendr
//
//  Created by Reqven on 23/05/2020.
//  Copyright © 2020 Manu Marchand. All rights reserved.
//

import UIKit

class NetworkManager {
    
    // MARK: - Properties
    static let shared   = NetworkManager()
    private let cache   = NSCache<NSString, UIImage>()
    private let baseUrl = "https://www.weekendr.eu/api/v1/"
    
    private init() {}
}

// MARK: - Methods
extension NetworkManager {
    
    fileprivate struct FlightSearch: Codable {
        let userID: String?
        let authorization: Bool
        let flights: [Flight]
    }
    
    func getFlights(from: Date, to: Date, completed: @escaping (Result<[Flight], Error>) -> Void) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let from = dateFormatter.string(from: from)
        let to   = dateFormatter.string(from: to)
        
        let endpoint = "\(baseUrl)flights?date_from=\(from)&date_to=\(to)&limit=10"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(NSError(domain: "Bad URL", code: 0)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(NSError(domain: "Task Error", code: 0)))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(NSError(domain: "Bad Response", code: 0)))
                return
            }
            
            guard let data = data else {
                completed(.failure(NSError(domain: "Bad Data", code: 0)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let search = try decoder.decode(FlightSearch.self, from: data)
                completed(.success(search.flights))
            } catch {
                completed(.failure(NSError(domain: "Error Decoding", code: 0)))
            }
        }
        task.resume()
    }
    
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self,
                error == nil,
                let response = response as? HTTPURLResponse, response.statusCode == 200,
                let data = data,
                let image = UIImage(data: data)
            else {
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}
