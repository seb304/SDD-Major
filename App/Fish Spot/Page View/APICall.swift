//
//  APICall.swift
//  Fish Spot
//
//  Created by Sebastian Baldwin on 1/5/21.
//

import Foundation
import SwiftUI

private let baseURLForCurrentWeather = URL(string: "https://api.openweathermap.org/data/2.5/weather")!
private let appid = "09a8e488d576c1dab695df3b02b900dd"
private let baseUrlForWeeklyWeather = URL(string: "https://api.openweathermap.org/data/2.5/forecast/daily")!

private var decoder: JSONDecoder{
    let decode = JSONDecoder()
    decode.keyDecodingStrategy = .convertFromSnakeCase
    return decode
}

class API{
    class func fetchCurrentWeather(by city: String, onSuccess: @escaping (Weather) -> Void){
        let query = ["q": "\(city)", "appid": appid, "units": "Imperial"]
        
        guard let url = baseURLForCurrentWeather.withQueries(queries: query) else{
            fatalError()
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else{
                fatalError(error!.localizedDescription)
            }
            do {
                let weather = try decoder.decode(Weather.self, from: data)
                DispatchQueue.main.async{
                    onSuccess(weather)
                }
            }
            catch{
                fatalError(error.localizedDescription)
            }
        }.resume()
    }
}

extension URL{
    func withQueries(queries: [String:String]) -> URL?{
        guard var component = URLComponents(url: self, resolvingAgainstBaseURL: true)
        else{
            fatalError()
        }
        component.queryItems = queries.map {URLQueryItem(name: $0.key, value: $0.value)}
        return component.url
    }
}
