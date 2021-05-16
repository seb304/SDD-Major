//
//  mapCentre.swift
//  Fish Spot
//
//  Created by Sebastian Baldwin on 7/5/21.
//

import Foundation
import MapKit


extension MKCoordinateRegion{
    static var defaultRegion: MKCoordinateRegion {
            MKCoordinateRegion(center: CLLocationCoordinate2D.init(latitude: -33.865143, longitude: 151.209900), latitudinalMeters: 100, longitudinalMeters: 100)
        }
}
