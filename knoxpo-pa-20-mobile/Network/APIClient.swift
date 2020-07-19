//
//  APIClient.swift
//  knoxpo-pa-20-mobile
//
//  Created by Girish Purandare on 19/07/20.
//  Copyright © 2020 Girish Purandare. All rights reserved.
//

import Foundation
import Alamofire

class APIClient{
    
    
    private var manager = SessionManager.default
    
    
    func executeRequest<T: RequestInterface, U>(request: T, completion: @escaping (U?, Error?) -> Void) where U == T.ResponceType {
        
        let url = APIConstants.BaseURL + "/" + request.path
        
        print(url)
        
        manager.request(url, method: request.method, parameters: request.params, encoding: request.encoding, headers: request.headers).responseData { dataResponce in
            if let data = dataResponce.data
            {
                print(data)
                let serializerResult = request.serializer.parceData(data: data)
                print(serializerResult)
                completion(serializerResult.responce, serializerResult.error)
            }
            else
            {
                completion(nil, nil)
            }
        }
    }
    
    func cancelAllRequests() -> Bool {
        
        return true
    }
    
}
