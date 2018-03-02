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
    public var API_BASE_URL: String = "http://localhost:3000/"
    weak var delegate:DataManagerDelegate?
    static var shared = DataManager()
    
    
    
    
    private init() {
        
    }
    
    
    
    func getFlights(origin: String, destination: String, departure_date: String, return_date: String?){
        DispatchQueue.main.async {
            HTTPHandler.get(urlString: "\(self.API_BASE_URL)/list?origin=\(origin)&destination=\(destination)&departure_date=\(departure_date)&return_date=\(return_date)", completionHandler: {(data: Data?) -> Void in
                if let data = data {
                    do {
                        print(data)
                    } catch{
                        
                    }
                }
            })
        }
        
    }
}
