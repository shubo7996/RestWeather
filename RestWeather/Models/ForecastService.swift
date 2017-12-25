//
//  ForecastService.swift
//  RestWeather
//
//  Created by Subhamoy Paul on 11/25/17.
//  Copyright © 2017 Subhamoy Paul. All rights reserved.
//

import Foundation

class ForecastService {
    
    let ForecastAPIKey : String
    let ForecastBaseURL : URL?
    
    
    init(APIKey : String) {
        self.ForecastAPIKey = APIKey
        self.ForecastBaseURL = URL(string: "https://api.darksky.net/forecast/\(APIKey)")
    }
    
}

func getForecast(lattitude : Double, longitude : Double, completion : @escaping (CurrentWeather?) -> Void) {
    
    if let forecastURL = URL(string: "\(lattitude),\(longitude)", relativeTo: ForecastBaseURL as URL? ) {
        
        let networkProcessor = NetworkProcessor(url: forecastURL)
        
        networkProcessor.downloadJSONFromURL({ (jsonDictionary) in
            
            if let currentWeatherDictionary = jsonDictionary?["currently"] as [String:Any] {
                let currentWeather = CurrentWeather(weatherDictionary : currentWeatherDictionary)
                completion(currentWeather) }
            else {
                    completion(nil)
                }
                
            
        })
    }
    
}

















