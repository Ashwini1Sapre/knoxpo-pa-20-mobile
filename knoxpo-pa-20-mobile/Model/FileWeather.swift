//
//  FileWeather.swift
//  knoxpo-pa-20-mobile
//
//  Created by Girish Purandare on 17/07/20.
//  Copyright © 2020 Girish Purandare. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CurrentWeather {
    
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    /// Downloading Current Weather Data
    ///
    /// - Parameter completed: Completion Handler.
    func downloadCurrentWeather(completed: @escaping DownloadComplete){
        Alamofire.request(API_URL).responseJSON { (response) in
            //print(response)
            //print(response)
            let result = response.result
            //print(result.value)
            let json = JSON(result.value)
            self._cityName = json["name"].stringValue
            let tempDate = json["dt"].double
            //print(tempDate)
            let convertedDate = Date(timeIntervalSince1970: tempDate!)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            let currentDate = dateFormatter.string(from: convertedDate)
            self._date = "\(currentDate)"
            //print(currentDate)
            self._weatherType = json["weather"][0]["main"].stringValue
            let downloadedTemp = json["main"]["temp"].double
          self._currentTemp = (downloadedTemp! - 273.15).rounded(toPlaces: 0)
            completed()
        }
        
    }
    
    
    func downloadCurrentWeather1(completed: @escaping DownloadComplete){
           Alamofire.request(NearBy_API_URL).responseJSON { (response) in
               //print(response)
               //print(response)
               let result = response.result
               //print(result.value)
               let json = JSON(result.value)
               
                print(json)
               
               self._cityName = json["message"].stringValue
               print( "  value of city \( json["message"].stringValue)" )
               
               let hobbies = json["list"][0]["name"] .stringValue
                 print( "  value of city \( hobbies)" )
               
               let names = json["list"].flatMap({ _ in ["coord"] })
            print(names)
             let defaults = UserDefaults.standard
            
               let placenames13 = json["list"].arrayValue.map{$0["name"] .stringValue}
                      print(placenames13)
            
             defaults.set(placenames13, forKey: "SavedNameArray")
             // let defaults = UserDefaults.standard
              let myarray = defaults.stringArray(forKey: "SavedNameArray") ?? [String]()
            
             print(myarray)
            let indexOfA = myarray[0]
                   print(indexOfA)
            
               let names14temp = json["list"].arrayValue.map{$0["main"]["temp"].double!}
                                 print(names14temp)
               
           // let names14temp1 = (names14temp - 273.15).rounded(toPlaces: 0)
            defaults.set(names14temp, forKey: "SavedTempArray")
            
            
            
               let names15cord = json["list"].arrayValue.map{$0["coord"]["lon"].double!}
               print(names15cord)
            
              defaults.set(names15cord, forKey: "SavedLongArray")
            
               let names15cord1 = json["list"].arrayValue.map{$0["coord"]["lat"].double!}
               print(names15cord1)
               
           defaults.set(names15cord1, forKey: "SavedLateArray")
                let array = defaults.array(forKey: "SavedLateArray")  as? [Double] ?? [Double]()
                     print(array)
                     let indexOfA1 = array[0]
                            print(indexOfA1)
                   
           let hobbies1 = json["list"][1]["name"] .stringValue
                            print( "  value of city \( hobbies1)" )
               let temp11 = json["list"][0]["main"]["temp"].double
               print( "  value of city \( String(describing: temp11))" )
            
            
            
               
            //   let defaults = UserDefaults.standard
                                   let myarrayName = defaults.stringArray(forKey: "SavedNameArray") ?? [String]()
                                 
                                  print(myarrayName)
                   // let Temparr = defaults.stringArray(forKey: "SavedTempArray") ?? [String]()
            
              let Temparr = defaults.array(forKey: "SavedTempArray")  as? [Double] ?? [Double]()
                                       
                                       print(Temparr)
                     // let Longarr = defaults.stringArray(forKey: "SavedLongArray") ?? [String]()
                                             
                                             // print(Longarr)
                      let array1 = defaults.array(forKey: "SavedLongArray")  as? [Double] ?? [Double]()
                      
                     // let Latarr = defaults.stringArray(forKey: "SavedLateArray") ?? [String]()
                                                    
                                                   //  print(Latarr)
                     // let array = defaults.array(forKey: "SavedLateArray")  as? [Double] ?? [Double]()
                      
                     // let indexOfA1 = array[0]
                          //   print(indexOfA1)
                     let indexOfA2 = array[1]
                                  print(indexOfA2)
                      
                      let indexOfb1 = array1[0]
                                         print(indexOfb1)
                      let indexOfb2 = array1[1]
                                         print(indexOfb2)
                      let temparrshow1 = Temparr[0]
             print(temparrshow1)
                        let temparrshow2 = Temparr[1]
             print(temparrshow2)
                       let namwarrshow1 = myarrayName[0]
             print(namwarrshow1)
                      let namwarrshow2 = myarrayName[1]
             print(namwarrshow2)
                      
        
               
               completed()
           }
           
       }
    
    
    
}
