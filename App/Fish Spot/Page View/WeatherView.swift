//
//  WeatherView.swift
//  Fish Spot
//
//  Created by Sebastian Baldwin on 2/4/21.
//

import SwiftUI
import Foundation

struct WeatherView: View {
    
    @State var CallWeather = false
    
    var body: some View {
        NavigationView {
            ZStack { // arranges contents in the z-axis
                Image("background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
                
                
                VStack{
                    
                    
                    Button("Get weather"){
                        
                        let url = URL(string: "https://api.weatherbit.io/v2.0/forecast/daily?lat=-33.865143&lon=151.209900&key=e3b4604aa99e44e3ac46a8aa92778de5")!
                        
                        var request = URLRequest(url: url)
                        

                        
                        request.httpMethod = "GET"

                        let session = URLSession.shared // api request
                        
                        session.dataTask(with: request) { (data, response, error) in
                                if let response = response {
                                    print(response)
                                }
                                if let data = data {
                                    do {
                                        
                                        let weather = try? JSONDecoder().decode(WeatherData.self, from: data)
                                        let response = weather!.datas.first?.temp
                                        print(response as Any)
                                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                                        print(json)
                                        
                                        
                                    } catch {
                                        print(error) // prints error
                                    }
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
        WeatherView()
    }
}

