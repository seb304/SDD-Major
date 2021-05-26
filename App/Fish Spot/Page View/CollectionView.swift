//
//  CollectionView.swift
//  Fish Spot
//
//  Created by Sebastian Baldwin on 2/4/21.
//

import SwiftUI

struct CollectionView: View {
    var body: some View {
        ZStack{
            Image("background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
            VStack(spacing: -40){
                Text("Collection")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.vertical).offset(y: -0).opacity(1).foregroundColor(Color.black)
                Spacer(minLength: 40)
                HStack(){
                    NavigationLink(destination: BreamView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                        ZStack{
                            Ellipse().fill(Color.white).frame(width: 170, height: 120).opacity(0.5).aspectRatio(contentMode: .fit).padding(.leading)
                            VStack{
                                Image("bream").resizable().padding(.leading).aspectRatio(contentMode: .fit).frame(width: 170, height: 170).offset(x: 0, y: 15)
                                Text("Bream")
                                    .font(.headline)
                                    .foregroundColor(Color.black).offset(y: -20)
                            }
                        }
                    }
                    NavigationLink(destination: FlatheadView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                        ZStack{
                            Ellipse().fill(Color.white).frame(width: 170, height: 120).opacity(0.5).aspectRatio(contentMode: .fit).offset(x: 0).padding(.trailing)
                            VStack{
                                Image("flathead").resizable().padding(.trailing).aspectRatio(contentMode: .fit).frame(width: 170, height: 170).offset(x: 0, y: 15)
                                Text("Flathead").font(.headline)
                                    .foregroundColor(Color.black).offset(y: -20)
                            }
                        }
                    }
                }
                Spacer(minLength: 40)
                HStack(){
                    NavigationLink(destination: FlounderView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                        ZStack{
                            Ellipse().fill(Color.white).frame(width: 170, height: 120).opacity(0.5).aspectRatio(contentMode: .fit).padding(.leading)
                            VStack{
                                Image("flounder").resizable().padding(.leading).aspectRatio(contentMode: .fit).frame(width: 170, height: 170).offset(x: 0, y: 15)
                                Text("Flounder")
                                    .font(.headline)
                                    .foregroundColor(Color.black).offset(y: -20)
                            }
                        }
                    }
                    NavigationLink(destination: KingfishView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                        ZStack{
                            Ellipse().fill(Color.white).frame(width: 170, height: 120).opacity(0.5).aspectRatio(contentMode: .fit).offset(x: 0).padding(.trailing)
                            VStack{
                                Image("kingfish").resizable().padding(.trailing).aspectRatio(contentMode: .fit).frame(width: 170, height: 170).offset(x: 15, y: 15).rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                                Text("Kingfish").font(.headline)
                                    .foregroundColor(Color.black).offset(y: -20)
                            }
                        }
                    }
                }
                Spacer(minLength: 40)
                HStack(){
                    NavigationLink(destination: SnapperView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                        ZStack{
                            Ellipse().fill(Color.white).frame(width: 170, height: 120).opacity(0.5).aspectRatio(contentMode: .fit).padding(.leading)
                            VStack{
                                Image("snapper").resizable().padding(.leading).aspectRatio(contentMode: .fit).frame(width: 170, height: 170).offset(x: 0, y: 15)
                                Text("Snapper")
                                    .font(.headline)
                                    .foregroundColor(Color.black)
                                    .padding(.leading)
                                    .offset(y: -20)
                            }
                        }
                    }
                    NavigationLink(destination: TunaView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                        ZStack{
                            Ellipse().fill(Color.white).frame(width: 170, height: 120).opacity(0.5).aspectRatio(contentMode: .fit).offset(x: 0).padding(.trailing)
                            VStack{
                                Image("tuna").resizable().padding(.trailing).aspectRatio(contentMode: .fit).frame(width: 170, height: 170).offset(x: 15, y: 15).rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                                Text("Tuna").font(.headline)
                                    .foregroundColor(Color.black)
                                    .padding(.trailing)
                                    .offset(y: -20)
                            }
                        }
                    }
                }
                Spacer()
                Spacer()
                ZStack{
                    Rectangle().fill(Color.blue).cornerRadius(40).frame(height: 220).offset(y: 100).padding(.top).opacity(0.5)
                    VStack(spacing: 40){
                        Text("Hello world").opacity(0)
                        HStack(spacing: 10){
                            Spacer()
                            NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                                Image("home").resizable().aspectRatio(contentMode: .fit).frame(width: 50, height: 60).padding(.top)
                            }
                            NavigationLink(destination: CameraView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                                Image("camera").resizable().aspectRatio(contentMode: .fit).frame(width:50, height: 60).padding(.top)
                            }
                            VStack{
                                Image("collection").resizable().aspectRatio(contentMode: .fit).frame(width:50, height: 60).padding(.top).offset(y: 14)
                                Circle().fill(Color.green).frame(width: 20, height: 20).opacity(0.3).offset(y: 10)
                            }
                            NavigationLink(destination: WeatherView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                                Image("weather").resizable().aspectRatio(contentMode: .fit).frame(width:50, height: 60).padding(.top)
                            }
                            NavigationLink(destination: LawView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                                Image("law").resizable().aspectRatio(contentMode: .fit).frame(width:50, height: 60).padding(.top)
                            }
                            NavigationLink(destination: FishingspotView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                                Image("map").resizable().aspectRatio(contentMode: .fit).frame(width:50, height: 60).padding(.top)
                            }
                            Spacer(minLength: 25)
                        }
                    }
                }

            }
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
