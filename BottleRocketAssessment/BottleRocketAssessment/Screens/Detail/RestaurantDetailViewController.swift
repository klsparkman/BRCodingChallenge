//
//  RestaurantDetailViewController.swift
//  BottleRocketAssessment
//
//  Created by Kelsey Sparkman on 9/13/21.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var restaurantLabel: UILabel!

    // MARK: - Properties
    var restaurant: Restaurant?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        if let restaurant = restaurant {
            restaurantLabel.text = restaurant.name
        }
    }
}
