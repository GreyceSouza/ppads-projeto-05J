//
//  HTTPHandler.swift
//  MackTravel
//
//  Created by Edison Cury on 2/28/18.
//  Copyright © 2018 Edison Cury. All rights reserved.
//

import Foundation


class HTTPHandler {
    static func get(urlString: String, completionHandler: @escaping (Data?) -> (Void)) {
        let urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlString!)
        
        print("URL being used is \(url!)")
        
        let session = URLSession.shared
        let task = session.dataTask(with: url!) {data, response, error in
            if let data = data{
                let httpResponse = response as! HTTPURLResponse
                let statusCode = httpResponse.statusCode
                print("request completed with code: \(statusCode)")
                if(statusCode == 200){
                    print("return to completion handler with the data")
                    completionHandler(data as Data)
                }
            }else if let error = error{
                print("*** There was an error making the HTTP request ***")
                print(error.localizedDescription)
                completionHandler(nil)
            }
        }
        task.resume()
    }
    
    static func post(urlString: String,parameter: Any, completionHandler: @escaping (Data?) -> (Void)){
        //create the url with URL
        let url = URL(string: urlString)!
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameter, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            
            do {
                if let data = data{
                    let httpResponse = response as! HTTPURLResponse
                    let statusCode = httpResponse.statusCode
                    print("request completed with code: \(statusCode)")
                    if(statusCode == 200){
                        print("return to completion handler with the data")
                        completionHandler(data as Data)
                    }
                }else if let error = error{
                    print("*** There was an error making the HTTP request ***")
                    print(error.localizedDescription)
                    completionHandler(nil)
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
}
