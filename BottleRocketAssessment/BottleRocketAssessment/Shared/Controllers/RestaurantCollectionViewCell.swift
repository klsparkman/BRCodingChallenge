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
    
    // MARK: - Properties
    static let identifier = "RestaurantCollectionViewCell"
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Helper Functions
    func configure(with restaurant: Restaurant) {
        fetchImagesForRestaurant(with: restaurant)
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
    
    static func nib() -> UINib {
        return UINib(nibName: "RestaurantCollectionViewCell", bundle: nil)
    }
}
