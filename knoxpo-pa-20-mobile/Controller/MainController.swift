//
//  ViewController.swift
//  knoxpo-pa-20-mobile
//
//  Created by Girish Purandare on 17/07/20.
//  Copyright © 2020 Girish Purandare. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class MainController: UIViewController, CLLocationManagerDelegate
{
   
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var currentCityTemp: UILabel!
    @IBOutlet weak var currentDate: UILabel!
    @IBOutlet weak var specialBG: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var NextViewClk: RoundedButton!
    
    @IBAction func NextViewClick(_ sender: Any)
    {
        //let viewController = Main1ViewController()
        
             
    //  navigationController?.pushViewController(viewController, animated: true)
        
        
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "Main1ViewController") as? Main1ViewController
        self.navigationController?.pushViewController(secondVC!, animated: true)
        
        
    }
    
    
    
    // Constants
    let locationManager = CLLocationManager()
    
    
    // Variables
    var currentWeather: CurrentWeather!
    var currentLocation: CLLocation!
    var forecastWeather: ForecastWeather!
    var forecastArray = [ForecastWeather]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callDelegates()
        currentWeather = CurrentWeather()
        setupLocation()
        applyEffect()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        locationAuthCheck()
        downloadForecastWeather {
            print("DATA DOWNLOADED")
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    
    
    /// Calling all the delegates and datasources
    func callDelegates() {
        locationManager.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    /// Here we are setting up some instructions for our location manager to follow.
    func setupLocation() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization() // Take Permission from the user
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    /// Here we are checking the location authentication status and if user did not authorize the location then we keep on asking :P
    func locationAuthCheck() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            // Get the location from the device
            currentLocation = locationManager.location
            
     Location.sharedInstance.latitude = currentLocation.coordinate.latitude
              Location.sharedInstance.longitude = currentLocation.coordinate.longitude
                     
           
            //Location.sharedInstance.latitude = 18.6298
                              //  Location.sharedInstance.longitude = 73.7997
            
            
            //18.6298, 73.7997
            // Download the API Data
            currentWeather.downloadCurrentWeather {
                // Update the UI after download is completed.
                self.updateUI()
            }
            currentWeather.downloadCurrentWeather1 {
                // Update the UI after download is completed.
                print("sucesss")
            }
            
            
            
        } else {
            locationManager.requestWhenInUseAuthorization()  // Take Permission from the user again
            locationAuthCheck()  // Make a check
        }
    }
    
    
    /// This function is used to apply the special effect on a particular UI.
    func applyEffect() {
        specialEffect(view: specialBG, intensity: 45)
    }
    
    
    /// This function creates the special effect of parallax
    ///
    /// - Parameters:
    ///   - view: UIView for ex: UIButton, UIImage, UIView etc
    ///   - intensity: Intensity at which the View will move.
    func specialEffect(view: UIView, intensity: Double) {
        let horizontalMotion = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        horizontalMotion.minimumRelativeValue = -intensity
        horizontalMotion.maximumRelativeValue = intensity
        
        let verticalMotion = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        verticalMotion.minimumRelativeValue = -intensity
        verticalMotion.maximumRelativeValue = intensity
        
        let movement = UIMotionEffectGroup()
        movement.motionEffects = [horizontalMotion, verticalMotion]
        view.addMotionEffect(movement)
    }
    
    
    /// This function updates the Current weather UI in our App.
    func updateUI() {
        cityName.text = currentWeather.cityName
        currentCityTemp.text = "\(Int(currentWeather.currentTemp))"
        weatherType.text = currentWeather.weatherType
        currentDate.text = currentWeather.date
    }
    
    /// This function downloads the forecast weather data
    ///
    /// - Parameter completed: We are using Alamofire with Forecast API url to download the weather forecast data.
    func downloadForecastWeather(completed: @escaping DownloadComplete) {
        Alamofire.request(FORECAST_API_URL).responseJSON { (response) in
            let result = response.result
            if let dictionary = result.value as? Dictionary<String, AnyObject> {
                if let list = dictionary["list"] as? [Dictionary<String, AnyObject>] {
                    for item in list {
                        let forecast = ForecastWeather(weatherDict: item)
                        self.forecastArray.append(forecast)
                        
                    }
                    print("arr is \(self.forecastArray)")
                    
                    self.forecastArray.remove(at: 0)
                    self.tableView.reloadData()
                }
            }
            completed()
        }
    }
}


// MARK: - UITableViewDelegate and UITableViewDataSource
extension MainController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastCell") as! WeatherCell
        
        cell.configureCell(forecastData: forecastArray[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastArray.count
    }


}

