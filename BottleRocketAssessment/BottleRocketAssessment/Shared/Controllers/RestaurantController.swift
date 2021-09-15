//
//  RestaurantController.swift
//  BottleRocketAssessment
//
//  Created by Kelsey Sparkman on 9/14/21.
//

import Foundation

class RestaurantController {
        
    // MARK: - Fetch restaurant function
    static func fetchRestaurants(completion: @escaping (Result<[Restaurant], RestaurantError>) -> Void) {
        guard let restaurantURL = URL(string: "https://s3.amazonaws.com/br-codingexams/restaurants.json") else {return}
        URLSession.shared.dataTask(with: restaurantURL) { data, response, error in
            if let error = error {
                completion(.failure(.thrownError(error)))
            }
            
            if let response = response as? HTTPURLResponse {
                print("RESTAURANT STATUS CODE: \(response.statusCode)")
            }
            
            guard let data = data else {return completion(.failure(.noData))}
            
            do {
                let topLevelObject = try JSONDecoder().decode(TopLevelObject.self, from: data)
                let restaurants = topLevelObject.restaurants
                completion(.success(restaurants))
            } catch {
                return completion(.failure(.unableToDecode))
            }
        }.resume()
    }
}
