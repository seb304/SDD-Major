//
//  WeatherModel.swift
//  Fish Spot
//
//  Created by Sebastian Baldwin on 14/6/21.
//

import Foundation

private let defaultIcon = "❓" // values that are displayed for weather
private let iconMap = [
  "Drizzle" : "🌧",
  "Thunderstorm" : "⛈",
  "Rain": "🌧",
  "Snow": "❄️",
  "Clear": "☀️",
  "Clouds" : "☁️",
]

public class WeatherModel: ObservableObject{ // base values before API updates them
    @Published var cityName: String = "City Name"
    @Published var temperature: String = "--"
    @Published var weatherDescription: String = "--"
    @Published var weatherIcon: String = defaultIcon
    @Published var maxtemp: String = "--"
    @Published var mintemp: String = "--"
    
    public let weatherServ: WeatherServ
    public init(weatherServ: WeatherServ){
        self.weatherServ = weatherServ
    }
    
    public func reload (){ // refreshes data and displays response from API
        weatherServ.loadData {weather in
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.temperature = "\(weather.temperature)ºC"
                self.maxtemp = "Max \(weather.maxtemp)ºC"
                self.mintemp = "Min \(weather.mintemp)ºC"
                self.weatherDescription = weather.description.capitalized
                self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
            }
        }
    }
}
