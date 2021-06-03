//
//  ContentView.swift
//  Fish Spot
//
//  Created by Sebastian Baldwin on 2/4/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Image("background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
                
                VStack(spacing: 5){
                    Image("logo").resizable().aspectRatio(contentMode: .fit).offset(y: -20).frame(width: 350, height: 300)
                    Spacer()
                    Spacer()
                    VStack(spacing: 0){
                        NavigationLink(destination: CameraView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                            ZStack{
                                Rectangle().fill(Color("homebutton")).frame(width: 340, height: 70).opacity(0.8).cornerRadius(15).aspectRatio(contentMode: .fit).padding(.bottom)
                                HStack{
                                    Image("camera").resizable().aspectRatio(contentMode: .fit).frame(width: 50, height: 50).aspectRatio(contentMode: .fit).padding(.bottom)
                                    Text("Verify").font(.largeTitle).fontWeight(.bold).foregroundColor(.white).padding().aspectRatio(contentMode: .fit).padding(.bottom).minimumScaleFactor(0.5)
                                }
                            }
                        }
                        HStack{
                            NavigationLink(destination: CollectionView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                                ZStack{
                                    Rectangle().fill(Color("homebutton")).frame(width: 170, height: 70).opacity(0.8).cornerRadius(15).aspectRatio(contentMode: .fit).padding([.leading, .bottom])
                                    HStack(spacing: 1){
                                        Image("collection").resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40).offset(x: 10).aspectRatio(contentMode: .fit).padding([.leading, .bottom])
                                        Text("Collection").font(.title3).fontWeight(.bold).foregroundColor(.white).padding().aspectRatio(contentMode: .fit).padding(.bottom).minimumScaleFactor(0.5)
                                    }
                                }
                            }
                            NavigationLink(destination: WeatherView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                                ZStack{
                                    Rectangle().fill(Color("homebutton")).frame(width: 170, height: 70).opacity(0.8).cornerRadius(15).aspectRatio(contentMode: .fit).padding([.bottom, .trailing])
                                    HStack(spacing: 0){
                                        Image("weather").resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40).offset(x: 10).aspectRatio(contentMode: .fit).padding([.bottom, .trailing])
                                        Text("Weather").font(.title3).fontWeight(.bold).foregroundColor(.white).padding().aspectRatio(contentMode: .fit).padding(.bottom).offset(x: -10).minimumScaleFactor(0.5)
                                    }
                                }
                            }
                        }
                       
                       
                        HStack{
                            NavigationLink(destination: LawView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                                ZStack{
                                    Rectangle().fill(Color("homebutton")).frame(width: 170, height: 70).opacity(0.8).cornerRadius(15).aspectRatio(contentMode: .fit).padding([.leading, .bottom])
                                    HStack(spacing: 1){
                                        Image("law").resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40).aspectRatio(contentMode: .fit).padding([.leading, .bottom]).offset(x: 5)
                                        Text("Laws").font(.title2).fontWeight(.bold).foregroundColor(.white).padding().aspectRatio(contentMode: .fit).padding([.bottom, .trailing]).offset(x: 15).minimumScaleFactor(0.5)
                                    }
                                }
                            }
                            NavigationLink(destination: FishingspotView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                                ZStack{
                                    Rectangle().fill(Color("homebutton")).frame(width: 170, height: 70).opacity(0.8).cornerRadius(15).aspectRatio(contentMode: .fit).padding([.bottom, .trailing])
                                    HStack{
                                        Image("map").resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40).aspectRatio(contentMode: .fit).padding([.bottom, .trailing]).offset(x: 10)
                                        Text("Spots").font(.title2).fontWeight(.bold).foregroundColor(.white).padding().aspectRatio(contentMode: .fit).padding([.bottom, .trailing]).offset(x: -5).minimumScaleFactor(0.5)
                                    }
                                }
                            }
                        }
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}



