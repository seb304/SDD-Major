//
//  BrightonMapView.swift
//  Fish Spot
//
//  Created by Sebastian Baldwin on 25/4/21.
//

import SwiftUI
import MapKit
import Combine

struct BrightonMapView: View {
    
    var body: some View {
        ZStack{
            Image("background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
            VStack{
                Text("Brighton-Le-Sands").foregroundColor(.black).font(.title3).fontWeight(.bold).padding().aspectRatio(contentMode: .fit).minimumScaleFactor(0.5)
            
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



