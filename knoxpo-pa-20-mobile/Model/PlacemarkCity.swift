//
//  PlacemarkCity.swift
//  knoxpo-pa-20-mobile
//
//  Created by Girish Purandare on 19/07/20.
//  Copyright © 2020 Girish Purandare. All rights reserved.
//

import Foundation
class PlacemarkCity {
    
    var city: String
    var country: String
    var lat : Double
    var lon : Double
    
    init(city: String, country: String, lat : Double, lon : Double) {
        self.city = city
        self.country = country
        self.lat = lat
        self.lon = lon
        
        //  //18.6298, 73.7997
    }
    
}
