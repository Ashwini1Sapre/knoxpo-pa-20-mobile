//
//  UrlClass.swift
//  knoxpo-pa-20-mobile
//
//  Created by Girish Purandare on 17/07/20.
//  Copyright © 2020 Girish Purandare. All rights reserved.
//


import Foundation

let API_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=7c609f73c5df2dff2f32e3e3cc33cd23"
let FORECAST_API_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=8&appid=7c609f73c5df2dff2f32e3e3cc33cd23"
let NearBy_API_URL = "http://api.openweathermap.org/data/2.5/find?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=8&appid=7c609f73c5df2dff2f32e3e3cc33cd23"

typealias DownloadComplete = () -> ()

