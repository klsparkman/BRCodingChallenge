//
//  RestaurantError.swift
//  BottleRocketAssessment
//
//  Created by Kelsey Sparkman on 9/14/21.
//

import Foundation

enum RestaurantError: LocalizedError {
    
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Unable to reach the server"
        case .thrownError(let error):
            print(error.localizedDescription)
            return "That restaurant does not exist"
        case .noData:
            return "The responded with no data"
        case .unableToDecode:
            return "The server responded with bad data"
        }
    }
} // End of enum
