//
//  GetWeatherForCity.swift
//  knoxpo-pa-20-mobile
//
//  Created by Girish Purandare on 19/07/20.
//  Copyright © 2020 Girish Purandare. All rights reserved.
//

import Foundation
class GetWeatherForCity: RequestInterface, BaseRequest {
    
    var cityString: String
    
    var path: String {
        return "weather"
    }
    
    var params: [String : AnyObject]? {
        var fullParams: [String : AnyObject] = appidDic as [String : AnyObject]
        fullParams["q"] = cityString as AnyObject?
        fullParams["units"] = "metric" as AnyObject?
        return fullParams
    }
    
    var serializer: Serializer<CityJson> {
        return JSONSerializer<CityJson>.valueSerializer()
    }
    
    init(cityString: String ) {
        self.cityString = cityString
    }
    
}
