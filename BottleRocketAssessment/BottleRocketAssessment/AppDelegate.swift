//
//  AppDelegate.swift
//  BottleRocketAssessment
//
//  Created by Kelsey Sparkman on 9/13/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

//    static let shared = AppDelegate()
//    var restaurants: [Restaurant] = []
//    var restaurantImages: [UIImage] = []


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        func fetchRestaurants() {
//            RestaurantController.fetchRestaurants { result in
//                switch result {
//                case .success(let restaurants):
//                    self.restaurants = restaurants
//                    func fetchRestaurantImages(restaurants: [Restaurant]) {
//                        for restaurant in restaurants {
//                            RestaurantController.fetchRestaurantImages(restaurant: restaurant) { result in
//                                switch result {
//                                case .success(let image):
//                                    self.restaurantImages.append(image)
////                                    DispatchQueue.main.async {
////                                        self.collectionView.reloadData()
////                                    }
//                                case .failure(let error):
//                                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
//                                }
//                            }
//                        }
//                    }
//                case .failure(let error):
//                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
//                }
//            }
//        }
        return true
        
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

