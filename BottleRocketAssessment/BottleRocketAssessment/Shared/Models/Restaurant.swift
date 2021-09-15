//
//  Restaurant.swift
//  BottleRocketAssessment
//
//  Created by Kelsey Sparkman on 9/13/21.
//

import Foundation

struct TopLevelObject {
    let restaurants: [Restaurant]
}

struct Restaurant: Codable {
    let name: String
    let backgroundImageURL: String
    let category: String
    let contact: Contact
    let location: Location
}

struct Contact: Codable {
    let phone: String
    let formattedPhone: String
    let twitter: String
}

struct Location: Codable {
    let address: String
    let crossStreet: String
    let lat: Double
    let lng: Double
    let postalCode: String
    let cc: String
    let city: String
    let state: String
    let country: String
    let formattedAddress: [String]
}
