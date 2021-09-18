//
//  RestaurantController.swift
//  BottleRocketAssessment
//
//  Created by Kelsey Sparkman on 9/14/21.
//

import UIKit


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
    
    // MARK: - Fetch restaurant images
    static func fetchRestaurantImages(restaurant: Restaurant, completion: @escaping (Result<UIImage, RestaurantError>) -> Void) {
        
        guard let imageURL = URL(string: restaurant.backgroundImageURL) else {return}
        
        if let dict = UserDefaults.standard.object(forKey: Constants.imageCache) as? [String:String] {
            if let path = dict[restaurant.backgroundImageURL] {
                if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                    guard let image = UIImage(data: data) else {return}
                    return completion(.success(image))
                }
            }
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            if let error = error {
                completion(.failure(.thrownError(error)))
            }
            
            if let response = response as? HTTPURLResponse {
                print("RESTAURANT IMAGE STATUS CODE: \(response.statusCode)")
            }
            
            guard let data = data else {return completion(.failure(.noData))}
            
            guard let image = UIImage(data: data) else {return completion(.failure(.unableToDecode))}
            storeImage(urlString: restaurant.backgroundImageURL, image: image)
            completion(.success(image))
        }.resume()
    }
    
    static func storeImage(urlString: String, image: UIImage) {
        let path = NSTemporaryDirectory().appending(UUID().uuidString)
        let url = URL(fileURLWithPath: path)
        let data = image.jpegData(compressionQuality: 0.5)
        try? data?.write(to: url)
        
        var dict = UserDefaults.standard.object(forKey: Constants.imageCache) as? [String:String]
        if dict == nil {
            dict = [String:String]()
        }
        dict![urlString] = path
        UserDefaults.standard.setValue(dict, forKey: Constants.imageCache)
    }
}
