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
    
    // MARK: - Private
    
    private func updateUI(with restaurant: Restaurant) {
//
//        let view = UIView(frame: restaurantImageView.frame)
//        let gradient = CAGradientLayer()
//        gradient.frame = view.frame
//
//        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
//        gradient.
//        gradient.locations = [0.0, 1.0]
//
//        view.layer.insertSublayer(gradient, at: 0)
//
//        restaurantImageView.addSubview(view)
//
//        restaurantImageView.bringSubviewToFront(view)
        
        DispatchQueue.main.async {
            self.restaurantNameLabel.text = restaurant.name
            self.restaurantCategoryLabel.text = restaurant.category
        }
    }
    
    private func fetchImagesForRestaurant(with restaurant: Restaurant) {
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
    
    // MARK: - Public
    func configure(with restaurant: Restaurant) {
        fetchImagesForRestaurant(with: restaurant)
        updateUI(with: restaurant)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "RestaurantCollectionViewCell", bundle: nil)
    }
}
