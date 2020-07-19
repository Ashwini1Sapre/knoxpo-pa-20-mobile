//
//  ForcastJson.swift
//  knoxpo-pa-20-mobile
//
//  Created by Girish Purandare on 19/07/20.
//  Copyright © 2020 Girish Purandare. All rights reserved.
//

import Foundation
class ForcastJson: JSONRepresentable {
    
    var detailsWeather = [DayWeatherModel]()
    
    
    required init?(json: [String : AnyObject]) {
        
        let listArray = json["list"]
        if let parseList = listArray as? Array<Any>{
            for index in parseList {
                if let index = index as? [String : AnyObject] {
                    let objectDetails = DayWeatherModel()
                    
                    if let date = index["dt_txt"] as? String {
                        objectDetails.name = date
                    }
                    
                    if let main = index["main"] {
                        objectDetails.temperature = main["temp"] as! Double
                    }
                    
                    let weather = index["weather"] as? [[String:AnyObject]]
                    if let weatherImage = weather?.first {
                        objectDetails.imageName = weatherImage["icon"] as! String
                    }
                    
                    self.detailsWeather.append(objectDetails)
                }
            }
        }else {
            let objectDetails = DayWeatherModel()
            objectDetails.name = "No information about this city"
            objectDetails.temperature = 0.0
            self.detailsWeather.append(objectDetails)
            
        }
    }
    
    
}
