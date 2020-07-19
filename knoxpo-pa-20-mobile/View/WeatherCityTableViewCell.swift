//
//  WeatherCityTableViewCell.swift
//  knoxpo-pa-20-mobile
//
//  Created by Girish Purandare on 19/07/20.
//  Copyright © 2020 Girish Purandare. All rights reserved.
//

import UIKit
struct Globals {
    
    // Convenience variable for the standard defaults
    private static var Defaults: UserDefaults { return UserDefaults.standard }
    
    struct SavedCalculationData {
        private static let DataArrayKey = "savedDataArray"
        static var dataArray: [String] {
            get {
                return Defaults.object(forKey: DataArrayKey) as? [String] ?? []
            }
            set {
                // This setter is called when the array contents change,
                // not just when a new array is set
                Defaults.set(newValue, forKey: DataArrayKey)
                Defaults.synchronize()
            }
        }
    }
}
class WeatherCityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tempImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    var str1 : String = ""
    var yourArray12 = ["Deep"]
    
    
    func configure(_ cityName: String? = nil, isDaily: Bool, detail: DayWeatherModel? = nil) {
        
        if isDaily {
            if let city = cityName {
                configufeIsDaily(city)
            }
        }else {
            if let detailInfo = detail {
                configureIsForecast(detailInfo)
            }
        }
    }
    
    func configufeIsDaily(_ cityName: String) {
        
        titleLabel.text = cityName
        APIProvider().getCityInfo(city: cityName) { (cityMain) in
            
            
            if let cityTemp: Double = cityMain.temp
            {
                
                self.temperatureLabel?.text = "\(String(format:"%.0f", cityTemp)) º"
                self.str1 = "\(String(format:"%.0f", cityTemp)) º"
                
                print(" str isssss\(String(describing: self.temperatureLabel?.text))")
                
                
                
            }
            
            
            if let cityIcon = cityMain.icon
            {
                self.tempImageView.image = UIImage(named: cityIcon)
            }
            else
            {
                self.tempImageView.image = UIImage(named: "none")
            }
            
           // Globals.SavedCalculationData.dataArray.append(self.str1)
           // print(" arrr isssss\(Globals.SavedCalculationData.dataArray) ")
           // print(" arrr isssss cnt\(Globals.SavedCalculationData.dataArray.count) ")
        }
        
    }
    
    func configureIsForecast(_ detailWeather: DayWeatherModel) {
        
        if let dateString = DataTimeFormat.getDay(detailWeather.name) {
            
            self.titleLabel.text = dateString
            
            self.str1 = dateString
            yourArray12.append(self.str1)
            
            print(" str isssss11122\(String(describing:self.titleLabel.text))")
        }
        
        print(" arrrr isssss11122 \(yourArray12)")
        self.temperatureLabel.text = "\(String(format:"%.0f", detailWeather.temperature)) º"
        self.tempImageView.image = UIImage(named: detailWeather.imageName)
    }
    
    /*
     func configureIsNearPlace(_ detailWeather: DayWeatherModel) {
     
     if let dateString = DataTimeFormat.getDay(detailWeather.name) {
     self.titleLabel.text = dateString
     print(" str isssss\(String(describing:self.titleLabel.text))")
     }
     self.temperatureLabel.text = "\(String(format:"%.0f", detailWeather.temperature)) º"
     self.tempImageView.image = UIImage(named: detailWeather.imageName)
     }
     
     */
    
}
