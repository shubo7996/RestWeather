//
//  CurrentWeather.swift
//  RestWeather
//
//  Created by Subhamoy Paul on 12/5/17.
//  Copyright © 2017 Subhamoy Paul. All rights reserved.
//

import Foundation


class CurrentWeather {
    let temperature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?

    init (weatherDictionary : [String:Any]) {
        temperature = weatherDictionary["temperature"] as? Int
        if let humidityDouble = weatherDictionary["humidity"] as? Double {
            humidity = Int(humidityDouble*100)
        } else {
            humidity = nil
        }
        if let precipProbabilityDouble = weatherDictionary["precipProbability"] as? Double {
            precipProbability = Int(precipProbabilityDouble*100)
        } else {
                precipProbability = nil
            }
        summary = weatherDictionary["summary"] as? String
        
        
        
        
    }
    






}

















