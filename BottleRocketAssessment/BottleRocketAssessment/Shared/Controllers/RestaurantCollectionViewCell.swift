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
    func configure(with image: UIImage) {
        restaurantImageView.image = image
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "RestaurantCollectionViewCell", bundle: nil)
    }
}
