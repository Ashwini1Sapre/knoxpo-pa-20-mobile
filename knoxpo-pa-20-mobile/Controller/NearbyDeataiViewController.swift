//
//  NearbyDeataiViewController.swift
//  knoxpo-pa-20-mobile
//
//  Created by Girish Purandare on 20/07/20.
//  Copyright © 2020 Girish Purandare. All rights reserved.
//

import UIKit

class NearbyDeataiViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var Tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     
      //  Tableview.delegate = self
       // Tableview.dataSource = self
        
       // Tableview.reloadData()
        
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         let defaults = UserDefaults.standard
               let myarrayName = defaults.stringArray(forKey: "SavedNameArray") ?? [String]()
             print(myarrayName)
                return myarrayName.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Tableview.dequeueReusableCell(withIdentifier: "NearByTableViewCell", for: indexPath) as! NearByTableViewCell
     let defaults = UserDefaults.standard
            let myarrayName = defaults.stringArray(forKey: "SavedNameArray") ?? [String]()
          let Temparr = defaults.array(forKey: "SavedTempArray")  as? [Double] ?? [Double]()
           let Temparr12 = Temparr[indexPath.row]
        
     let temparrshow1 = String(format: "%.0f", Temparr12 - 273.15)
        cell.NameLabel.text = myarrayName[indexPath.row]
        
        cell.temperatureLabel.text = temparrshow1.description
        return cell
    }
   

}
//extension NearbyDeataiViewController: UITableViewDataSource, UITableViewDelegate{
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        let defaults = UserDefaults.standard
//        let myarrayName = defaults.stringArray(forKey: "SavedNameArray") ?? [String]()
//        print(myarrayName)
//        return myarrayName.count
//        
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NearByTableViewCell.self), for: indexPath) as! NearByTableViewCell
//        let defaults = UserDefaults.standard
//        let myarrayName = defaults.stringArray(forKey: "SavedNameArray") ?? [String]()
//        
//        //print(myarrayName)
//        
//        let Temparr = defaults.array(forKey: "SavedTempArray")  as? [Double] ?? [Double]()
//        print(Temparr)
//        // let Longarr = defaults.stringArray(forKey: "SavedLongArray") ?? [String]()
//        
//        // print(Longarr)
//        let array1 = defaults.array(forKey: "SavedLongArray")  as? [Double] ?? [Double]()
//        
//        // let Latarr = defaults.stringArray(forKey: "SavedLateArray") ?? [String]()
//        
//        //  print(Latarr)
//        let array = defaults.array(forKey: "SavedLateArray")  as? [Double] ?? [Double]()
//        cell.NameLabel.text = myarrayName[indexPath.row]
//        
//       // cell.temperatureLabel.text = Temparr[indexPath.row]
//    
//       // cell.LatLabel.text =
//        
//        return cell
//}
//}
