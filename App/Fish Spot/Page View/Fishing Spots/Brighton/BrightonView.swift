//
//  BrightonMapView.swift
//  Fish Spot
//
//  Created by Sebastian Baldwin on 25/4/21.
//

import SwiftUI
import MapKit

struct BrightonView: View {
    
    
    var body: some View {
        ZStack {
            Image("background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
            
            VStack{
                Image("Brighton").resizable().padding().aspectRatio(contentMode: .fit)
                Spacer()
                HStack{
                    Text("Fish at Cooks River").font(.title3).fontWeight(.bold).foregroundColor(.black).padding().aspectRatio(contentMode: .fit)
                }
                HStack{
                    NavigationLink(destination: FlatheadView()){
                        ZStack{
                            Rectangle().fill(Color.white).cornerRadius(20).opacity(0.5).frame(width: 175, height: 110)
                            Image("flathead").resizable().aspectRatio(contentMode: .fit).frame(width: 150, height: 100)
                        }
                    }
                    NavigationLink(destination: SnapperView()){
                        ZStack{
                            Rectangle().fill(Color.white).cornerRadius(20).opacity(0.5).frame(width: 175, height: 110)
                            Image("snapper").resizable().aspectRatio(contentMode: .fit).frame(width: 150, height: 100)
                        }
                    }
                }
                Spacer(minLength: 20)
                NavigationLink(destination: BrightonMapView()){
                    ZStack{
                        Rectangle().fill(Color("homebutton")).frame(width: 340, height: 60).opacity(0.8).cornerRadius(15).aspectRatio(contentMode: .fit).padding(.bottom)
                        HStack{
                            Image("map").resizable().aspectRatio(contentMode: .fit).frame(width: 50, height: 40).aspectRatio(contentMode: .fit).padding(.bottom)
                            Text("Get Route").font(.title).fontWeight(.bold).foregroundColor(.white).padding().aspectRatio(contentMode: .fit).padding(.bottom).minimumScaleFactor(0.5)
                        }
                    }
                }
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
                                Image("map").resizable().aspectRatio(contentMode: .fit).frame(width:50, height: 60).padding(.top)
                            }
                            Spacer(minLength: 20)
                        }
                    }
                }
            }
        }
    }
}

struct BrightonView_Previews: PreviewProvider {
    static var previews: some View {
        BrightonView()
    }
}


