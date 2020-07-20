//
//  CurrentLocationViewController.swift
//  knoxpo-pa-20-mobile
//
//  Created by Girish Purandare on 19/07/20.
//  Copyright © 2020 Girish Purandare. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps

import GooglePlaces
//import GoogleMapsCore

struct State {
    let name: String
    let long: CLLocationDegrees
    let lat: CLLocationDegrees
}
class CurrentLocationViewController: UIViewController {
    
    @IBOutlet weak var tempImageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var currentCityLabel: UILabel!
    @IBOutlet  weak var mapView: GMSMapView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    let locationManager = CLLocationManager()
    var timer: Timer? = nil
   /* let states = [
        State(name: "Alaska", long: -152.404419, lat: 61.370716),
        State(name: "Alabama", long: -86.791130, lat: 32.806671),
        // the other 51 states here...
    ]
*/
    override func viewDidLoad() {
        super.viewDidLoad()
       /* let states = [
            State(name: "Alaska", long: -152.404419, lat: 61.370716),
            State(name: "Alabama", long: -86.791130, lat: 32.806671),
             State(name: "Alabama", long: 151.20, lat: -33.86)
            // the other 51 states here...
        ]*/
        setupLocationManager()
        
      /*  for state in states {
            let state_marker = GMSMarker()
            state_marker.position = CLLocationCoordinate2D(latitude: state.lat, longitude: state.long)
            state_marker.title = state.name
            state_marker.snippet = "Hey, this is \(state.name)"
            state_marker.map = mapView
        }*/
    }
    
    
    override func viewDidAppear(_ animated: Bool)
    {
         
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if timer == nil {
            startTimer()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        stopTimer()
    }
    
    func startTimer () {
        if firstView.isHidden {
            if timer == nil {
                timer =  Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
            }
        }
    }
    
    func stopTimer() {
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
    }
    
    func setMap(city: PlacemarkCity) {
        let camera = GMSCameraPosition.camera(withLatitude: city.lat, longitude: city.lon, zoom: 8.0)
        mapView.camera = camera
        do {
            // Set the map style by passing the URL of the local file.
            if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
        
        print(" arrr isssss\(Globals.SavedCalculationData.dataArray) ")
      showMarker(position: camera.target, city: city)
        let defaults = UserDefaults.standard
                     let myarrayName = defaults.stringArray(forKey: "SavedNameArray") ?? [String]()
                   
                    //print(myarrayName)
      
          let Temparr = defaults.array(forKey: "SavedTempArray")  as? [Double] ?? [Double]()
                        print(Temparr)
       // let Longarr = defaults.stringArray(forKey: "SavedLongArray") ?? [String]()
                               
                               // print(Longarr)
        let array1 = defaults.array(forKey: "SavedLongArray")  as? [Double] ?? [Double]()
        
       // let Latarr = defaults.stringArray(forKey: "SavedLateArray") ?? [String]()
                                      
                                     //  print(Latarr)
        let array = defaults.array(forKey: "SavedLateArray")  as? [Double] ?? [Double]()
        
        let indexOfA1 = array[0]
               
       let indexOfA2 = array[1]
                  
        let indexOfA3 = array[2]
      let indexOfA4 = array[3]
        
        let indexOfb1 = array1[0]
                           print(indexOfA2)
        let indexOfb2 = array1[1]
                           print(indexOfA2)
        let indexOfb3 = array1[2]
        let indexOfb4 = array1[3]
        print(indexOfA2)
        let temparrshow1 = String(format: "%.0f", Temparr[0] - 273.15)
          let temparrshow2 = String(format: "%.0f", Temparr[1] - 273.15)
         let temparrshow3 = String(format: "%.0f", Temparr[2] - 273.15)
         let temparrshow4 = String(format: "%.0f", Temparr[3] - 273.15)
         let namwarrshow1 = myarrayName[0]
        let namwarrshow2 = myarrayName[1]
         let namwarrshow3 = myarrayName[2]
        let namwarrshow4 = myarrayName[3]
        
        
        let marker = GMSMarker()
        
        marker.position = CLLocationCoordinate2D(latitude: indexOfA1, longitude: indexOfb1)
        marker.title = temparrshow1.description
        marker.snippet = namwarrshow1
         marker.map = mapView
        
        marker.position = CLLocationCoordinate2D(latitude: indexOfA2, longitude: indexOfb2)
        marker.title = temparrshow2.description
               marker.snippet = namwarrshow2
         marker.map = mapView
        
        marker.position = CLLocationCoordinate2D(latitude: indexOfA3, longitude: indexOfb3)
        marker.title = temparrshow3.description
                     marker.snippet = namwarrshow3
        marker.map = mapView
        
        marker.position = CLLocationCoordinate2D(latitude: indexOfA4, longitude: indexOfb4)
               marker.title = temparrshow4.description
                            marker.snippet = namwarrshow4
               marker.map = mapView
       
        
        
    }
    
    func showMarker(position: CLLocationCoordinate2D, city: PlacemarkCity){
        let marker = GMSMarker()
        marker.position = position
        marker.title = city.city
        marker.snippet = city.country
        marker.map = mapView
       
        
    }
    
    @IBAction func showDetailInfoButtonPressed(_ sender: Any) {
        
        if InternetCheck.isConnectedToNetwork() {
            let selectedItem = self.currentCityLabel.text
            let viewController = DetailsWeatherTableViewController()
            viewController.nameCity = selectedItem!
            navigationController?.pushViewController(viewController, animated: true)
        }else {
            stopTimer()
            showMessage("No Internet")
        }
    }
   
    
    @IBAction func NearbyDetail(_ sender: Any)
    {
           if InternetCheck.isConnectedToNetwork() {
                 //let defaults = UserDefaults.standard
                       //     let myarrayName = defaults.stringArray(forKey: "SavedNameArray") ?? [String]()
               //  let viewController = DetailsWeatherTableViewController()
               //  viewController.nameCity = myarrayName[0]
                // navigationController?.pushViewController(viewController, animated: true)
            
            let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "NearbyDeataiViewController") as? NearbyDeataiViewController
                   self.navigationController?.pushViewController(secondVC!, animated: true)
                   
            
            
             }else {
                 stopTimer()
                 showMessage("No Internet")
             }
        
        
    }
    
    
    
    
    
    @objc func update() {
        
        if InternetCheck.isConnectedToNetwork() {
            
            APIProvider().getNearInfo(city: self.currentCityLabel.text!) { (city) in
                if self.tempLabel.text != "\(String(format:"%.0f", city.temp!)) º"
                {
                    self.tempLabel.text = "\(String(format:"%.0f", city.temp!)) º"
                }
                if self.tempImageView.restorationIdentifier != city.icon
                {
                    self.tempImageView.image = UIImage(named: city.icon!)
                }
            }
        }else {
            stopTimer()
            showMessage("No Internet")
        }
    }
}

