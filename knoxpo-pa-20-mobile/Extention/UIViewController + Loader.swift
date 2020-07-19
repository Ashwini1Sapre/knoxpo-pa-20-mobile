//
//  UIViewController + Loader.swift
//  knoxpo-pa-20-mobile
//
//  Created by Girish Purandare on 19/07/20.
//  Copyright © 2020 Girish Purandare. All rights reserved.
//

import Foundation
import PKHUD

extension UIViewController {
    
    func showLoader() {
        HUD.show(.progress)
    }
    
    func hideLoader() {
        HUD.hide()
    }
    
    func showMessage(_ message: String) {
        HUD.flash(.label(message))
    }
    
    func checkInternet() {
        if !InternetCheck.isConnectedToNetwork() {
            showMessage("No Internet")
            
        }
    }
}
