//
//  Location.swift
//  Fish Spot
//
//  Created by Sebastian Baldwin on 7/5/21.
//

import Foundation
import CoreLocation

class UserLocation: NSObject, ObservableObject{
    private let userLocation = CLLocationManager()
    @Published var location: CLLocation?
    
    override init(){
        super.init()
        userLocation.desiredAccuracy = kCLLocationAccuracyBest
        userLocation.distanceFilter = kCLDistanceFilterNone
        userLocation.requestAlwaysAuthorization()
        userLocation.startUpdatingLocation()
        userLocation.delegate = self
    }
}

extension UserLocation: CLLocationManagerDelegate{
    
    func userLocation(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        guard let location = locations.last else{ return }
        
        DispatchQueue.main.sync{
            self.location = location
        }
    }
    
}
