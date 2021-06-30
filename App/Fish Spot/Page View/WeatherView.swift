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
                
                ZStack{
                    
                    Rectangle().fill(Color.white).opacity(0.4).frame(width: 350, height: 450).cornerRadius(30)
                    
                    VStack{
                        Spacer()
                        Text(viewModel.cityName).font(.largeTitle).padding()
                        Spacer()
                        Text(viewModel.temperature).font(.system(size: 70)).bold()
                        HStack{
                            Text(viewModel.mintemp).bold()
                            Text("|")
                            Text(viewModel.maxtemp).bold()
                        }
                        Text(viewModel.weatherIcon).font(.largeTitle).padding()
                        Text(viewModel.weatherDescription)
                        Spacer()
                        
                        
                    }.onAppear(perform: viewModel.reload)
                }
                
                
                
                ZStack{
                    Rectangle().fill(Color.blue).cornerRadius(40).offset(y: 35).frame(height: 150).padding(.top).opacity(0.5).ignoresSafeArea()
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
                            VStack{
                                Image("weather").resizable().aspectRatio(contentMode: .fit).frame(width:50, height: 60).padding(.top).offset(y: 14)
                                Circle().fill(Color.green).frame(width: 20, height: 20).opacity(0.3).offset(y: 10)
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


struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: WeatherModel(weatherServ: WeatherServ()))
    }
}

