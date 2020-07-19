//
//  File.swift
//  knoxpo-pa-20-mobile
//
//  Created by Girish Purandare on 17/07/20.
//  Copyright © 2020 Girish Purandare. All rights reserved.
//

import Foundation
extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
