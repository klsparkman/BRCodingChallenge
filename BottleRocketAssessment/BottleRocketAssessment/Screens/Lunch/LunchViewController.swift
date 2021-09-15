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
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
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
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath)
        
        return cell
    }
}

// lets us specify margin and padding
//extension LunchViewController: UICollectionViewDelegateFlowLayout{}

