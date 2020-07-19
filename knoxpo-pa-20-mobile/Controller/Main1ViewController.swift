//
//  Main1ViewController.swift
//  knoxpo-pa-20-mobile
//
//  Created by Girish Purandare on 19/07/20.
//  Copyright © 2020 Girish Purandare. All rights reserved.
//

import UIKit
import CarbonKit
class Main1ViewController: UIViewController , CarbonTabSwipeNavigationDelegate {
    
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        
        guard let storyboard = storyboard else { return UIViewController() }
        if InternetCheck.isConnectedToNetwork(){
            if index == 0 {
                return storyboard.instantiateViewController(withIdentifier: "CurrentLocationViewController")
            }
            return storyboard.instantiateViewController(withIdentifier: "CitiesViewController")
        }else {
            showMessage("No Internet")
            return storyboard.instantiateViewController(withIdentifier: "CitiesViewController")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabSwipe = CarbonTabSwipeNavigation(items: InternetCheck.isConnectedToNetwork() ? ["Current location", "Cities on devise"] : ["Cities on devise"], delegate: self)
        tabSwipe.setNormalColor(UIColor(hexString: "4B6FA6"))
        tabSwipe.setSelectedColor(UIColor.white)
        tabSwipe.setIndicatorColor(UIColor(hexString: "71E9CA"))
        tabSwipe.carbonTabSwipeScrollView.backgroundColor = UIColor(hexString: "18263b")
        tabSwipe.setTabExtraWidth(40)
        tabSwipe.insert(intoRootViewController: self)
        
    }
}

