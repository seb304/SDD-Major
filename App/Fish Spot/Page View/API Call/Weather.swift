//
//  Weather.swift
//  Fish Spot
//
//  Created by Sebastian Baldwin on 14/6/21.
//

import Foundation

// Stores values from API call as strings

public struct Weather {
    let city: String
    let temperature: String
    let maxtemp: String
    let mintemp: String
    let description: String
    let iconName: String
    
    init(response: APIReponse){
        city = response.name
        temperature = "\(Int(response.main.temp))"
        maxtemp = "\(Int(response.main.temp_max))"
        mintemp = "\(Int(response.main.temp_min))"
        description = response.weather.first?.description ?? ""
        iconName = response.weather.first?.iconName ?? ""
    }
}
