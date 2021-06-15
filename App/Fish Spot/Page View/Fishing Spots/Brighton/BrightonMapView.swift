//
//  BrightonMapView.swift
//  Fish Spot
//
//  Created by Sebastian Baldwin on 25/4/21.
//

import SwiftUI
import MapKit


struct Brighton: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct BrightonMapView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -33.9738, longitude: 151.1479), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))

    let BrightonMarker = [
        Brighton(name: "Cooks River", coordinate: CLLocationCoordinate2D(latitude: -33.9652, longitude: 151.1512)),

    ]

    var body: some View {
        
        ZStack{
            
            Image("background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
            
            
            Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, annotationItems: BrightonMarker)
            {
                MapMarker(coordinate: $0.coordinate, tint: .blue)
                
            }.offset(y: -150).ignoresSafeArea()
            
            VStack{
                
                Spacer()

                ZStack{
                    Rectangle().fill(Color.white).cornerRadius(40).offset(y: 55).frame(height: 320)
                    
                    VStack{
                        Spacer()
                        Text("Cook's River").font(.title2).fontWeight(.bold).foregroundColor(Color("homebutton")).multilineTextAlignment(.center).offset(y: 40)
                        Text("Brighton-Le-Sands").font(.subheadline).fontWeight(.bold).foregroundColor(Color("homebutton")).multilineTextAlignment(.center).offset(y: 50)
                        VStack{
                            Text("Fish avaliable at Cook's River").font(.subheadline).fontWeight(.bold).foregroundColor(Color("homebutton")).multilineTextAlignment(.center).offset(y: 70)
                            HStack{
                                NavigationLink(destination: FlatheadView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                                    ZStack{
                                        Ellipse().fill(Color("homebutton")).frame(width: 130, height: 70).opacity(0.5).aspectRatio(contentMode: .fit).padding(.leading)
                                        VStack{
                                            Image("flathead").resizable().padding(.leading).aspectRatio(contentMode: .fit).frame(width: 130, height: 101).offset(x: 0, y: 15)
                                        }
                                    }
                                }
                                NavigationLink(destination: SnapperView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                                    ZStack{
                                        Ellipse().fill(Color("homebutton")).frame(width: 130, height: 70).opacity(0.5).aspectRatio(contentMode: .fit).padding(.leading)
                                        VStack{
                                            Image("snapper").resizable().padding(.leading).aspectRatio(contentMode: .fit).frame(width: 130, height: 110).offset(x: 0, y: 15)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    Image("Brighton").resizable().clipShape(Circle()).shadow(radius: 10).overlay(Circle().stroke(Color.blue, lineWidth: 2)).frame(width: 300, height: 200).offset(y: -90)
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

struct BrightonMapView_Previews: PreviewProvider {
    static var previews: some View {
        BrightonMapView()
            .previewDevice("iPhone 12")
    }
}



