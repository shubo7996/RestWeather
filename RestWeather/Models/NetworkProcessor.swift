//
//  NetworkProcessor.swift
//  RestWeather
//
//  Created by Subhamoy Paul on 11/24/17.
//  Copyright © 2017 Subhamoy Paul. All rights reserved.
//

import Foundation

class NetworkProcessor {
    
    lazy var configuration: URLSessionConfiguration = URLSessionConfiguration.default
    lazy var session: URLSession =  URLSession.init(configuration: configuration)
    
    let url: URL
    
    init(url: URL){
        self.url = url
    }
    
    typealias JSONDictainaryHandler = (([String:Any]?) -> Void)
    
    func DownloadJSONFromURL(_ completion : @escaping JSONDictainaryHandler) {
        let request = URLRequest(url: self.url)
        let dataTask =  session.dataTask(with: request) { (data, Response, error) in
            
            if error == nil {
                if let httpResponse = Response as? HTTPURLResponse {
                    switch httpResponse.statusCode {
                    case 200 :
                    //succesfull
                        if let data = data {
                            do {
                                let jsondictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                                
                                completion(jsondictionary as? [String:Any])
                            } catch let error as NSError {
                                print ("error : \(error.localizedDescription)")
                            }
                        }
                    
                    default :
                        print ("HTTP Response Code :\(httpResponse.statusCode)")
                    }
                }
                
            } else {
                print("Error : \(error?.localizedDescription)")
            }
        }
        dataTask.resume()
    }
    
    
}
