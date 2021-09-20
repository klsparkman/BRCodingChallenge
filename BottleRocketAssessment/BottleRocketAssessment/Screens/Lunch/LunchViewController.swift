//
//  LunchViewController.swift
//  BottleRocketAssessment
//
//  Created by Kelsey Sparkman on 9/13/21.
//

import UIKit

class LunchViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    
    var restaurants: [Restaurant] = []
    var restaurantImages: [UIImage] = []
    var selectedRestaurant: Restaurant?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(RestaurantCollectionViewCell.nib(), forCellWithReuseIdentifier: RestaurantCollectionViewCell.identifier)
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
        fetchRestaurants()
    }
    
    // MARK: - Private
    private func fetchRestaurants() {
        RestaurantController.fetchRestaurants { result in
            switch result {
            case .success(let restaurants):
                self.restaurants = restaurants
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            if let destination = segue.destination as? RestaurantDetailViewController,
               let indexPath = self.collectionView.indexPathsForSelectedItems?.first {
                destination.restaurant = self.restaurants[indexPath.row]
                destination.restaurantArray = self.restaurants
            }
        } else {
            if segue.identifier == "toMapViewFromList" {
                if let destination = segue.destination as? MapViewController {
                    destination.restaurants = self.restaurants
                }
            }
        }
    }
}

// MARK: - Extensions

extension LunchViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedRestaurant = self.restaurants[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: self)
    }
}

extension LunchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.restaurants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCollectionViewCell.identifier, for: indexPath) as? RestaurantCollectionViewCell else {return UICollectionViewCell()}
        let restaurant = self.restaurants[indexPath.row]
        cell.configure(with: restaurant)
        return cell
    }
}

extension LunchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if view.frame.width > 1000 {
            return CGSize(width: view.frame.width / 3, height: 180)
        } else {
            return CGSize(width: view.frame.width, height: 180)
        }
    }
}
