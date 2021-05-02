//
//  WeatherData.swift
//  Fish Spot
//
//  Created by Sebastian Baldwin on 1/5/21.
//

import Foundation


// Stores all values recieved from the Weather Api


struct Weather: Codable {
    let id, dt, cod, timezone: Int
    let name, base: String
    let coord: Coord
    let weather: [WeatherData]
    let main: Main
    let clouds: Clouds
    let sys: Sys
}

struct Coord: Codable{
    let lon, lat: Double
}

struct WeatherData: Codable, Identifiable{
    let id: Int
    let main, description, icon: String
}

struct Main: Codable{
    let temp, tempMin, tempMax: Double
    let pressure, humidity: Int
}

struct Clouds: Codable{
    let all: String
}

struct Sys: Codable{
    let id, type, surise, sunset: Int
    let country: String
}
