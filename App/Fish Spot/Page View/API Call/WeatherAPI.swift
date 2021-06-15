//
//  WeatherAPI.swift
//  Fish Spot
//
//  Created by Sebastian Baldwin on 13/6/21.
//

import Foundation
import CoreLocation

public final class WeatherServ: NSObject {
    private let locationManager = CLLocationManager() // values sent to API
    private let APIKey = "08ebe0aa77a234dd66915f4a443d258e"
    private var completionHandler: ((Weather) -> Void)?
    
    public override init(){
        super.init()
        locationManager.delegate = self
    }
    
    public func loadData(_ completionHandler: @escaping((Weather) -> Void)) { // request for users location
        self.completionHandler = completionHandler
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func dataRequest(forCoordinates coordinates: CLLocationCoordinate2D) { // API call and reponse handle
        guard let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(APIKey)&units=metric".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else  {return}
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) {data, reponse, error in
            guard error == nil, let data = data else {return}
            if let response = try? JSONDecoder().decode(APIReponse.self, from: data){
                self.completionHandler?(Weather(response: response))
            }
        }.resume()
    }
}

extension WeatherServ: CLLocationManagerDelegate{ // Users location
    public func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ){
        guard let location = locations.first else {return}
        dataRequest(forCoordinates: location.coordinate)
    }
    
    public func locationManager(_ manager:CLLocationManager, didFailWithError error: Error){
        print("Something went wrong: \(error.localizedDescription)")
    }
}

struct APIReponse: Decodable{ // Store reponse values
    let name: String
    let main: WeatherAPIMain
    let weather: [WeatherAPI]
}

struct WeatherAPIMain: Decodable{
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

struct WeatherAPI: Decodable{
    let description: String
    let iconName: String
    
    enum CodingKeys: String, CodingKey {
        case description
        case iconName = "main"
    }
}
