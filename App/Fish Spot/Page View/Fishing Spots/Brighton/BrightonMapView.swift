//
//  BrightonMapView.swift
//  Fish Spot
//
//  Created by Sebastian Baldwin on 25/4/21.
//

import SwiftUI
import MapKit

struct BrightonMapView: View {
    var body: some View {
        ZStack{
            Image("background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
            VStack{
                Text("Brighton-Le-Sands").foregroundColor(.black).font(.title3).fontWeight(.bold).padding().aspectRatio(contentMode: .fit).minimumScaleFactor(0.5)
                MapTab().padding().frame(height: 500)
                Spacer()
            }
        }
    }
}

struct BrightonMapView_Previews: PreviewProvider {
    static var previews: some View {
        BrightonMapView()
            .previewDevice("iPhone 12")
    }
}

struct MapTab: UIViewRepresentable {
    typealias UIViewType = MKMapView
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        let centre = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -33.8688, longitude: 151.2093), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        mapView.setRegion(centre, animated: true)
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
}

