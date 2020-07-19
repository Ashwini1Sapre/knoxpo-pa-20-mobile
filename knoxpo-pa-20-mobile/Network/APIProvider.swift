//
//  APIProvider.swift
//  knoxpo-pa-20-mobile
//
//  Created by Girish Purandare on 19/07/20.
//  Copyright © 2020 Girish Purandare. All rights reserved.
//

import Foundation
import Alamofire


class APIProvider {
    
    //    var detailsWeather : [DayWeatherModel] = []
    var manager = APIClient()
    
    func getCityInfo(city: String, completion: @escaping (CityJson) -> Void)
    {
        
        manager.executeRequest(request: GetWeatherForCity(cityString:city)) { (cityMain, error) in
            if let cityMain = cityMain {
                completion(cityMain)
            }
        }
    }
    
    
    func getNearInfo(city: String, completion: @escaping (CityJson1) -> Void)
    {
        
        manager.executeRequest(request: GetWeatherNearBy(cityNearString:city)) { (cityMain, error) in
            if let cityMain = cityMain {
                completion(cityMain)
            }
        }
    }
    
    
    
    func getForecastWeather(_ cityName: String, completion: @escaping ([DayWeatherModel]) -> Void)  {
        manager.executeRequest(request: GetWeatherForecast(citySearchString:cityName)) { (cityMain, error) in
            
            if let cityMain = cityMain {
                //                self.detailsWeather = cityMain.detailsWeather
                completion(cityMain.detailsWeather)
            }
            
        }
    }
    
    
    
}
