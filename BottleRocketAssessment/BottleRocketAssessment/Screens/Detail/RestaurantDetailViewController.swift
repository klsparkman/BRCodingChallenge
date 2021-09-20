//
//  RestaurantDetailViewController.swift
//  BottleRocketAssessment
//
//  Created by Kelsey Sparkman on 9/13/21.
//

import UIKit
import MapKit

class RestaurantDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var restaurantCategoryLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var twitterLabel: UILabel!
    @IBOutlet weak var restaurantMapView: MKMapView!
    
    // MARK: - Properties
    var restaurant: Restaurant?
    let annotation = MKPointAnnotation()
    var restaurantArray: [Restaurant]?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        if let restaurant = restaurant {
            let location = CLLocation(latitude: restaurant.location.lat, longitude: restaurant.location.lng)
            annotation.coordinate = CLLocationCoordinate2D(latitude: restaurant.location.lat, longitude: restaurant.location.lng)
            restaurantMapView.addAnnotation(annotation)
            restaurantMapView.centerToLocation(location)
            restaurantNameLabel.text = restaurant.name
            restaurantCategoryLabel.text = restaurant.category
            let address = restaurant.location.formattedAddress
            addressLabel.text = "\(address[0]) \n\(address[1]))"
            if restaurant.contact != nil {
                phoneNumberLabel.text = restaurant.contact!.formattedPhone
                if restaurant.contact?.twitter != nil {
                    twitterLabel.text = "@\(restaurant.contact!.twitter ?? "")"
                } else if restaurant.contact?.facebookUsername != nil {
                    twitterLabel.text = "Facebook: \( restaurant.contact?.facebookUsername ?? "")"
                }
            } else {
                phoneNumberLabel.text = "No phone number available"
                twitterLabel.text = "No social media account available"
            }
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMapViewFromDetail" {
            if let destination = segue.destination as? MapViewController {
                destination.restaurants = self.restaurantArray
            }
        }
    }
}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
