//
//  FishingspotView.swift
//  Fish Spot
//
//  Created by Sebastian Baldwin on 2/4/21.
//

import SwiftUI

struct FishingspotView: View {
    var body: some View {
        ZStack { // arranges contents in the z-axis
            Image("background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
            
            VStack{
                Spacer()
                NavigationLink(destination: ParsleyView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                    ZStack{
                        Rectangle().fill(Color.white).opacity(0.7).cornerRadius(20).frame(width: 370, height: 80)
                        HStack{
                            Image("Parsley").resizable().aspectRatio(contentMode: .fit).padding(.trailing).frame(width: 120, height: 80).offset(x: -10)
                            VStack{
                                Text("Parsley Bay").font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.leading)
                                Text("Vaucluse").font(.body).foregroundColor(Color.black).padding(.trailing)
                            }
                            Text(">")
                                .font(.title)
                                .foregroundColor(Color.black)
                                .padding(.horizontal).offset(x: 20)
                        }
                    }
                }
                
                NavigationLink(destination: HarbourView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                    ZStack{
                        Rectangle().fill(Color.white).opacity(0.7).cornerRadius(20).frame(width: 370, height: 80)
                        HStack{
                            Image("Harbour").resizable().aspectRatio(contentMode: .fit).padding(.trailing).frame(width: 120, height: 80)
                            VStack{
                                Text("Beulah St Wharf").font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.leading)
                                Text("Sydney Harbour").font(.body).foregroundColor(Color.black).padding(.trailing)
                            }
                            Text(">")
                                .font(.title)
                                .foregroundColor(Color.black)
                                .padding(.horizontal)
                        }
                    }
                }
                
                NavigationLink(destination: BrightonView().navigationBarHidden(true)){
                    ZStack{
                        Rectangle().fill(Color.white).opacity(0.7).cornerRadius(20).frame(width: 370, height: 80)
                        HStack{
                            Image("Brighton").resizable().aspectRatio(contentMode: .fit).padding(.trailing).frame(width: 110, height: 80)
                            VStack{
                                Text("Cooks River").font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.leading)
                                Text("Brighton-Le-Sands").font(.body).foregroundColor(Color.black).padding(.trailing)
                            }
                            Text(">")
                                .font(.title)
                                .foregroundColor(Color.black)
                                .padding(.horizontal)
                        }
                    }
                }
                
                NavigationLink(destination: GordanView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                    ZStack{
                        Rectangle().fill(Color.white).opacity(0.7).cornerRadius(20).frame(width: 370, height: 80)
                        HStack{
                            Image("Gordan").resizable().aspectRatio(contentMode: .fit).padding(.trailing).frame(width: 120, height: 80).offset(x: -10)
                            VStack{
                                Text("Gordan's Bay").font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.leading)
                                Text("Clovelly").font(.body).foregroundColor(Color.black).padding(.trailing)
                            }
                            Text(">")
                                .font(.title)
                                .foregroundColor(Color.black)
                                .padding(.horizontal).offset(x: 10)
                        }
                    }
                }
                
                NavigationLink(destination: GymeaView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                    ZStack{
                        Rectangle().fill(Color.white).opacity(0.7).cornerRadius(20).frame(width: 370, height: 80)
                        HStack{
                            Image("Gymea").resizable().aspectRatio(contentMode: .fit).padding(.trailing).frame(width: 120, height: 80).offset(x: -10)
                            VStack{
                                Text("Gymea Baths").font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                                    .multilineTextAlignment(.leading)
                                Text("Gymea Bay").font(.body).foregroundColor(Color.black).padding(.trailing)
                            }
                            Text(">")
                                .font(.title)
                                .foregroundColor(Color.black)
                                .padding(.horizontal).offset(x: 10)
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

struct FishingspotView_Previews: PreviewProvider {
    static var previews: some View {
        FishingspotView()
            .previewDevice("iPhone 12")
    }
}
