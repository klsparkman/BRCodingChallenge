//
//  RestaurantCollectionViewCell.swift
//  BottleRocketAssessment
//
//  Created by Kelsey Sparkman on 9/14/21.
//

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var restaurantImageView: UIImageView!
    
    @IBOutlet weak var restaurantNameLabel: UILabel!
    
    @IBOutlet weak var restaurantCategoryLabel: UILabel!
    
    // MARK: - Properties
    static let identifier = "RestaurantCollectionViewCell"
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Helper Functions
    func configure(with restaurant: Restaurant) {
        fetchImagesForRestaurant(with: restaurant)
        updateUI(with: restaurant)
    }
    
    func fetchImagesForRestaurant(with restaurant: Restaurant) {
        RestaurantController.fetchRestaurantImages(restaurant: restaurant) { result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self.restaurantImageView.image = image
                }
            case .failure(let error):
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
        }
    }
    
    func updateUI(with restaurant: Restaurant) {
        DispatchQueue.main.async {
            self.restaurantNameLabel.text = restaurant.name
            self.restaurantCategoryLabel.text = restaurant.category
        }
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "RestaurantCollectionViewCell", bundle: nil)
    }
}
