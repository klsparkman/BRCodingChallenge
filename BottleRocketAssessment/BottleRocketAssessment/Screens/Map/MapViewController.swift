//
//  MapViewController.swift
//  BottleRocketAssessment
//
//  Created by Kelsey Sparkman on 9/19/21.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    // MARK: - Properties
    var restaurants: [Restaurant]?
    var annotationLocations: [[String: Any]] = [[:]]
    let distanceSpan: CLLocationDistance = 25000
    
    // MARK: - Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createAnnotationLocations()
    }
    
    private func createAnnotationLocations() {
        if let restaurants = restaurants {
            for restaurant in restaurants {
                let restaurantInfo = [Constants.name: restaurant.name, Constants.latitude: restaurant.location.lat, Constants.longitude: restaurant.location.lng] as [String: Any]
                self.annotationLocations.append(restaurantInfo)
            }
            createAnnotations(locations: annotationLocations)
            let firstLocation = annotationLocations[1]
            let location = CLLocation(latitude: firstLocation[Constants.latitude] as? Double ?? 0, longitude: firstLocation[Constants.longitude] as? Double ?? 0)
            zoomLevel(location: location)
        }
    }
    
    private func createAnnotations(locations: [[String: Any]]) {
        for location in locations {
            let annotation = MKPointAnnotation()
            annotation.title = location[Constants.name] as? String
            annotation.coordinate = CLLocationCoordinate2D(latitude: location[Constants.latitude] as? Double ?? 0, longitude: location[Constants.longitude] as? Double ?? 0)
            mapView.addAnnotation(annotation)
        }
    }
    
    private func zoomLevel(location: CLLocation) {
//        let location = CLLocation(latitude: 31.9686, longitude: -99.9018)
        let mapCoordinates = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: distanceSpan, longitudinalMeters: distanceSpan)
        mapView.setRegion(mapCoordinates, animated: true)
    }
}
