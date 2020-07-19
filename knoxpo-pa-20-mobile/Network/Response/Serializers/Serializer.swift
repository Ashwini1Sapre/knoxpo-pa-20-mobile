//
//  Serializer.swift
//  knoxpo-pa-20-mobile
//
//  Created by Girish Purandare on 19/07/20.
//  Copyright © 2020 Girish Purandare. All rights reserved.
//

import Foundation
class Serializer<T> {
    
    func parceData(data: Data, headers: Dictionary<String, AnyObject>? = nil) -> (responce: T?, error: Error?) {
        fatalError("Not implemented parceData")
    }
    
}

class EmptySerializer: Serializer<Bool> {
    
    override func parceData(data: Data, headers: Dictionary<String, AnyObject>? = nil) -> (responce: Bool?, error: Error?) {
        return (true, nil)
    }
}

class DataSerializer: Serializer<Data> {
    
    override func parceData(data: Data, headers: Dictionary<String, AnyObject>? = nil) -> (responce: Data?, error: Error?) {
        return (data, nil)
    }
}
