//
//  WeatherView.swift
//  Fish Spot
//
//  Created by Sebastian Baldwin on 2/4/21.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        NavigationView {
            ZStack { // arranges contents in the z-axis
                Image("background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
                
                
                VStack{
                    
                    ZStack{
                        Rectangle().fill(Color.white).cornerRadius(40).opacity(0.6).frame(width: 320, height: 150)
                    }
                    
                    HStack{
                        ZStack{
                            Rectangle().fill(Color.white).cornerRadius(40).opacity(0.6).frame(width: 160, height: 150)
                        }
                        ZStack{
                            Rectangle().fill(Color.white).cornerRadius(40).opacity(0.6).frame(width: 160, height: 150)
                        }
                    }
                    HStack{
                        ZStack{
                            Rectangle().fill(Color.white).cornerRadius(40).opacity(0.6).frame(width: 160, height: 150)
                        }
                        ZStack{
                            Rectangle().fill(Color.white).cornerRadius(40).opacity(0.6).frame(width: 160, height: 150)
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
                                    Image("camera").resizable().aspectRatio(contentMode: .fit).frame(width: 50, height: 60).padding(.top)
                                }
                                NavigationLink(destination: CollectionView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                                    Image("collection").resizable().aspectRatio(contentMode: .fit).frame(width:50, height: 60).padding(.top)
                                }
                                NavigationLink(destination: WeatherView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                                    Image("weather").resizable().aspectRatio(contentMode: .fit).frame(width:50, height: 60).padding(.top)
                                }
                                NavigationLink(destination: LawView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                                    Image("law").resizable().aspectRatio(contentMode: .fit).frame(width:50, height: 60).padding(.top)
                                }
                                VStack{
                                    Image("map").resizable().aspectRatio(contentMode: .fit).frame(width:50, height: 60).padding(.top).offset(y: 14)
                                    Circle().fill(Color.green).frame(width: 20, height: 20).opacity(0.3).offset(y: 10)
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

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}

