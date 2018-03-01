//
//  DataManager.swift
//  MackTravel
//
//  Created by Edison Cury on 2/28/18.
//  Copyright © 2018 Edison Cury. All rights reserved.
//

import Foundation

protocol DataManagerDelegate : class {
    func requestCompleted()
}


class DataManager {
    public var API_BASE_URL: String = ""
    weak var delegate:DataManagerDelegate?
    static var shared = DataManager()
    
    
    
    
    private init() {
        
    }
    
    
    
    func getFlightList(input: String){
        DispatchQueue.main.async {
            HTTPHandler.post(urlString: self.API_BASE_URL, parameter: [], completionHandler: {(data: Data?) -> Void in
                if let data = data {
                    do {
                        
                    } catch{
                        
                    }
                }
            })
        }
        
    }
}
