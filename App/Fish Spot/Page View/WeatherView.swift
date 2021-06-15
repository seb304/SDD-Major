//
//  WeatherView.swift
//  Fish Spot
//
//  Created by Sebastian Baldwin on 2/4/21.
//

import SwiftUI
import Foundation

struct WeatherView: View {
    
    @ObservedObject var viewModel: WeatherModel
    
    var body: some View {
        ZStack{
            
            Image("background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
            
            VStack{
                
                VStack{
                    Text(viewModel.cityName).font(.largeTitle).padding()
                    Text(viewModel.temperature).font(.system(size: 70)).bold()
                    Text(viewModel.weatherIcon).font(.largeTitle).padding()
                    Text(viewModel.weatherDescription)
                    
                    HStack{
                        Text(viewModel.maxtemp)
                        Text(viewModel.mintemp)
                    }
                    
                }.onAppear(perform: viewModel.reload)
                
                ZStack{
                    Rectangle().fill(Color.blue).cornerRadius(40).frame(height: 160).offset(y: 1).padding(.top).opacity(0.5)
                    VStack(spacing: 28){
                        
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
                        Text("ok").opacity(0).padding()
                    }
                }
            }
        }
    }
}


struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: WeatherModel(weatherServ: WeatherServ()))
    }
}

