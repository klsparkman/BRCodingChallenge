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
    var restaurants: [Restaurant]?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(RestaurantCollectionViewCell.nib(), forCellWithReuseIdentifier: RestaurantCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        RestaurantController.fetchRestaurants { result in
            switch result {
            case .success(let restaurants):
                self.restaurants = restaurants
                for restaurant in restaurants {
                    print(restaurant.name)
                }
            case .failure(let error):
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}

// MARK: - Extensions
// Pick up interacttions with the cells
extension LunchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("You tapped me!")
    }
}

extension LunchViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.restaurants != nil {
            return restaurants!.count
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCollectionViewCell.identifier, for: indexPath) as? RestaurantCollectionViewCell else {return UICollectionViewCell()}
        cell.configure(with: UIImage(named: "bus")!)
        
        return cell
    }
}

// lets us specify margin and padding
//extension LunchViewController: UICollectionViewDelegateFlowLayout{}

