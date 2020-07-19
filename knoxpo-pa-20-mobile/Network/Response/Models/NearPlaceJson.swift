//
//  NearPlaceJson.swift
//  knoxpo-pa-20-mobile
//
//  Created by Girish Purandare on 19/07/20.
//  Copyright © 2020 Girish Purandare. All rights reserved.
//

import Foundation

class CityJson1: JSONRepresentable {
    
    var name: String?
    var temp: Double?
    var icon: String?
    
    
    required init?(json: [String : AnyObject]) {
        
        if let cityName = json["name"] as? String {
            self.name = cityName
            
            if let main = json["main"] {
                self.temp = main["temp"] as? Double
            }
            
            let weather = json["weather"] as? [[String:AnyObject]]
            if let weatherImage = weather?.first {
                self.icon = weatherImage["icon"] as? String
            }
            
        } else {
            return nil
        }
    }
    
}
