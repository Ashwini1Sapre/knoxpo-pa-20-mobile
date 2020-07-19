//
//  CityTableViewCell.swift
//  knoxpo-pa-20-mobile
//
//  Created by Girish Purandare on 19/07/20.
//  Copyright © 2020 Girish Purandare. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var countryCityLabel: UILabel!
    
    func configure(city: PlacemarkCity) {
        cityNameLabel.text = city.city
        countryCityLabel.text = city.country
    }

}
