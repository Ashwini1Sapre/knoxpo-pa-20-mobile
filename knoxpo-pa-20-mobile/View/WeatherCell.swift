//
//  WeatherCell.swift
//  knoxpo-pa-20-mobile
//
//  Created by Girish Purandare on 17/07/20.
//  Copyright © 2020 Girish Purandare. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet weak var forecastTemp: UILabel!
    @IBOutlet weak var forecastDay: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(forecastData: ForecastWeather) {
        self.forecastDay.text = "\(forecastData.date)"
        self.forecastTemp.text = "\(Int(forecastData.temp))"
        
    }
}
