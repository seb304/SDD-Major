//
//  HarbourMapView.swift
//  Fish Spot
//
//  Created by Sebastian Baldwin on 25/4/21.
//

import SwiftUI
import MapKit

struct Harbour: Identifiable {
    let id = UUID()
    let name: String
    let coordinates: CLLocationCoordinate2D
}

struct HarbourMapView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -33.8568, longitude: 151.2153), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
    
    let HarbourMarker = [
        Harbour(name: "Beulah St Wharf", coordinates: CLLocationCoordinate2D(latitude: -33.8517, longitude: 151.2170))
    ]
    
    var body: some View {
        
        ZStack{
            
            Image("background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
            
            
            Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, annotationItems: HarbourMarker)
            {
                MapMarker(coordinate: $0.coordinates, tint: .blue)
                
            }.offset(y: -150).ignoresSafeArea()
            
            VStack{
                
                Spacer()

                ZStack{
                    Rectangle().fill(Color.white).cornerRadius(40).offset(y: 230).frame(height: 120)
                    
                    VStack{
                        Spacer()
                        Text("OK").opacity(0).padding()
                        HStack(spacing: 10){
                            Text("Beulah St Wharf").font(.title3).fontWeight(.bold).foregroundColor(Color("homebutton")).offset(y: 25)
                            Text("|").font(.title).foregroundColor(Color("homebutton")).offset(y: 25)
                            Text("Sydney Harbour").font(.subheadline).fontWeight(.bold).foregroundColor(Color("homebutton")).offset(y: 25)
                        }
                        
                    }
                    
                    Image("Harbour").resizable().clipShape(Circle()).shadow(radius: 10).overlay(Circle().stroke(Color.blue, lineWidth: 2)).frame(width: 140, height: 140).offset(y: 150)
                }
                

                    
                    ZStack{
                        
                        
                        ZStack{
                            Rectangle().fill(Color.blue).cornerRadius(40).offset(y: 35).frame(height: 150).padding(.top).opacity(0.5).ignoresSafeArea()
                            VStack(spacing: 40){
                                HStack(spacing: 10){
                                    Spacer()
                                    NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                                        Image("home").resizable().aspectRatio(contentMode: .fit).frame(width: 50, height: 60).padding(.top)
                                    }
                                    NavigationLink(destination: CameraView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                                        Image("camera").resizable().aspectRatio(contentMode: .fit).frame(width:50, height: 60).padding(.top)
                                    }
                                    NavigationLink(destination: CollectionView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                                        Image("collection").resizable().aspectRatio(contentMode: .fit).frame(width:50, height: 60).padding(.top)
                                    }
                                    NavigationLink(destination: WeatherView(viewModel: WeatherModel(weatherServ: WeatherServ())).navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                                        Image("weather").resizable().aspectRatio(contentMode: .fit).frame(width:50, height: 60).padding(.top)
                                    }
                                    NavigationLink(destination: LawView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                                        Image("law").resizable().aspectRatio(contentMode: .fit).frame(width:50, height: 60).padding(.top)
                                    }
                                    NavigationLink(destination: FishingspotView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                                        VStack{
                                            Image("map").resizable().aspectRatio(contentMode: .fit).frame(width:50, height: 60).padding(.top).offset(y: 12)
                                            Circle().fill(Color.green).frame(width: 20, height: 20).opacity(0.3).offset(y: 10)
                                        }
                                    }
                                    Spacer(minLength: 20)
                                }
                            }
                        }
                        
                    }
            }
        }
        
    }
}

struct HarbourMapView_Previews: PreviewProvider {
    static var previews: some View {
        HarbourMapView()
    }
}
