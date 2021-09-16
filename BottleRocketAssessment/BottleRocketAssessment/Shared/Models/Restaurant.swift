//
//  Restaurant.swift
//  BottleRocketAssessment
//
//  Created by Kelsey Sparkman on 9/13/21.
//

import Foundation

struct TopLevelObject: Codable {
    let restaurants: [Restaurant]
}

struct Restaurant: Codable {
    let name: String
    let backgroundImageURL: String
    let category: String
    let contact: Contact?
    let location: Location
    
    struct Contact: Codable {
        let formattedPhone: String
        let twitter: String?
        let facebookUsername: String?
    }
    
    struct Location: Codable {
        let formattedAddress: [String]
        let lat: Double
        let lng: Double
    }
}


