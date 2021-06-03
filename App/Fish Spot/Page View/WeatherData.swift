//
//  WeatherData.swift
//  Fish Spot
//
//  Created by Sebastian Baldwin on 26/5/21.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

struct WeatherData: Codable {
    let datas: [Datum]
    let cityName: String
    let lon: Double
    let timezone: String
    let lat: Double
    let countryCode, stateCode: String

    enum CodingKeys: String, CodingKey {
        case datas
        case cityName = "city_name"
        case lon, timezone, lat
        case countryCode = "country_code"
        case stateCode = "state_code"
    }
}

struct Datum: Codable {
    let moonriseTs: Int
    let windCdir: String
    let rh: Int
    let pres, highTemp: Double
    let sunsetTs: Int
    let ozone, moonPhase, windGustSpd: Double
    let snowDepth, clouds, ts, sunriseTs: Int
    let appMinTemp, windSpd: Double
    let pop: Int
    let windCdirFull: String
    let slp, moonPhaseLunation: Double
    let validDate: String
    let appMaxTemp, vis, dewpt: Double
    let snow: Int
    let uv: Double
    let weather: Weather
    let windDir: Int
    let cloudsHi: Int
    let precip, lowTemp, maxTemp: Double
    let moonsetTs: Int
    let datetime: String
    let temp, minTemp: Int
    let cloudsMid, cloudsLow: Int

    enum CodingKeys: String, CodingKey {
        case moonriseTs = "moonrise_ts"
        case windCdir = "wind_cdir"
        case rh, pres
        case highTemp = "high_temp"
        case sunsetTs = "sunset_ts"
        case ozone
        case moonPhase = "moon_phase"
        case windGustSpd = "wind_gust_spd"
        case snowDepth = "snow_depth"
        case clouds, ts
        case sunriseTs = "sunrise_ts"
        case appMinTemp = "app_min_temp"
        case windSpd = "wind_spd"
        case pop
        case windCdirFull = "wind_cdir_full"
        case slp
        case moonPhaseLunation = "moon_phase_lunation"
        case validDate = "valid_date"
        case appMaxTemp = "app_max_temp"
        case vis, dewpt, snow, uv, weather
        case windDir = "wind_dir"
        case cloudsHi = "clouds_hi"
        case precip
        case lowTemp = "low_temp"
        case maxTemp = "max_temp"
        case moonsetTs = "moonset_ts"
        case datetime, temp
        case minTemp = "min_temp"
        case cloudsMid = "clouds_mid"
        case cloudsLow = "clouds_low"
    }
}


struct Weather: Codable {
    let icon: String
    let code: Int
    let weatherDescription: String

    enum CodingKeys: String, CodingKey {
        case icon, code
        case weatherDescription = "description"
    }
}
