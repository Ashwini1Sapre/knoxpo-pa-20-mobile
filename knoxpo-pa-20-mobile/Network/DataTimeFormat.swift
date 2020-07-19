//
//  DataTimeFormat.swift
//  knoxpo-pa-20-mobile
//
//  Created by Girish Purandare on 19/07/20.
//  Copyright © 2020 Girish Purandare. All rights reserved.
//

import Foundation
public class DataTimeFormat {
    
    static func getDay(_ today: String) -> String? {
        
        let dateFormatterMonth: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, EEEE HH:mm"
            return dateFormatter
        }()
        
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let todayDate = formatter.date(from: today) else { return nil }
        let stringDate = dateFormatterMonth.string(from: todayDate)
        return stringDate.uppercased()
    }
    
    
    
}
