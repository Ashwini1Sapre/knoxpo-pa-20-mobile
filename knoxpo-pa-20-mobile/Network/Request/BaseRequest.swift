//
//  BaseRequest.swift
//  knoxpo-pa-20-mobile
//
//  Created by Girish Purandare on 19/07/20.
//  Copyright © 2020 Girish Purandare. All rights reserved.
//

import Foundation
protocol BaseRequest {
    var appidDic: [String : String] { get }
}

extension RequestInterface where Self: BaseRequest {
    
    var appidDic: [String : String] {
        return ["APPID" : APIConstants.APIKey]
    }
    
}
