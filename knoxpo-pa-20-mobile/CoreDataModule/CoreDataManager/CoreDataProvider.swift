//
//  CoreDataProvider.swift
//  knoxpo-pa-20-mobile
//
//  Created by Girish Purandare on 19/07/20.
//  Copyright © 2020 Girish Purandare. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataProvider{
    
    let fetchRequest = NSFetchRequest<City>(entityName: "City")
    
    static func isCityExistInCoreData(cityNameString:String) -> Bool{
        
        let predicate = NSPredicate(format: "name == %@ ", cityNameString)
        let fetchRequest = NSFetchRequest<City>(entityName: "City")
        fetchRequest.predicate = predicate
        if try! CoreDataManager.instance.managedObjectContext.fetch(fetchRequest).count > 0 {
            return true
        }else{
            return false
        }
    }
    
    static func saveCityToCoreData(city: String, completion: @escaping ()->Void ){
        let cityObject = City(context: CoreDataManager.instance.managedObjectContext)
        if cityObject == cityObject {
            cityObject.name = city
            CoreDataManager.instance.saveContext()
            completion()
        }
    }
}
