//
//  WeatherView.swift
//  Fish Spot
//
//  Created by Sebastian Baldwin on 2/4/21.
//

import SwiftUI
import Foundation

struct WeatherView: View {
    
    
    
    var body: some View {
        NavigationView {
            ZStack { // arranges contents in the z-axis
                Image("background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
                
                
                VStack{
                    
                    
                    Button("Get weather"){
                        
                        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Sydney&appid=09a8e488d576c1dab695df3b02b900dd")!
                        
                        var request = URLRequest(url: url)
                        
                        request.httpMethod = "GET"

                        let session = URLSession.shared
                        session.dataTask(with: request) { (data, response, error) in

                            if let error = error {
                                print(error)
                            } else if let data = data {
                                print(data)
                            } else {
                                print(".")
                            }
                        }.resume()
                    }
                        
                        
                    }.padding().offset(y: 70).foregroundColor(.white).background(Color("homebutton").opacity(0.6).cornerRadius(10.0).frame(width: 170).offset(y: 70))
                    
                    
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


struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}

