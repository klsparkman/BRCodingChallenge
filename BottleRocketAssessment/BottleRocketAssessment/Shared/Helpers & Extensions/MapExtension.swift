//
//  MapExtension.swift
//  BottleRocketAssessment
//
//  Created by Kelsey Sparkman on 9/19/21.
//

import MapKit

extension MKMapView {
    
    func centerToLocation (
        _ location: CLLocation,
        regionRadius: CLLocationDistance = 1000) {
        let coordinateRegion = MKCoordinateRegion (
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}
