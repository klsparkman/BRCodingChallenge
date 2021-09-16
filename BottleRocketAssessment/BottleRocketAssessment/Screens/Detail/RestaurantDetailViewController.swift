//
//  RestaurantDetailViewController.swift
//  BottleRocketAssessment
//
//  Created by Kelsey Sparkman on 9/13/21.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var restaurantCategoryLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var twitterLabel: UILabel!
    
    // MARK: - Properties
    var restaurant: Restaurant?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        if let restaurant = restaurant {
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
                twitterLabel.text = "No social media account available"
            }
        }
    }
}
