//
//  GetWeatherNearBy.swift
//  knoxpo-pa-20-mobile
//
//  Created by Girish Purandare on 19/07/20.
//  Copyright © 2020 Girish Purandare. All rights reserved.
//

import Foundation
class GetWeatherNearBy: RequestInterface, BaseRequest {
    
    var cityNearString: String
    
    var path: String {
        return "find"
    }
    
    var params: [String : AnyObject]? {
        var fullParams: [String : AnyObject] = appidDic as [String : AnyObject]
        fullParams["q"] = cityNearString as AnyObject?
        fullParams["units"] = "metric" as AnyObject?
        return fullParams
    }
    
    var serializer: Serializer<CityJson1> {
        return JSONSerializer<CityJson1>.valueSerializer()
    }
    
    init(cityNearString: String ) {
        self.cityNearString = cityNearString
    }
    
}
