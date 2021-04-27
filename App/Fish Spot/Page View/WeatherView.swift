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
                    Text("Top Fishing Spots").font(.title2).fontWeight(.bold).foregroundColor(Color.black).padding()
                    NavigationLink(destination: BrightonView()){
                        ZStack{
                            Rectangle().fill(Color.white).cornerRadius(20).opacity(0.7).frame(width: 370, height: 100)
                            HStack{
                                Image("Brighton").resizable().aspectRatio(contentMode: .fit).padding(.horizontal).frame(width: 140, height: 100)
                                VStack{
                                    Text("Cooks River")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.black)
                                        .multilineTextAlignment(.leading)
                                    Text("Brighton-Le-Sands")
                                        .font(.body).foregroundColor(Color.black).padding(.trailing)
                                }
                                Text(">")
                                    .font(.title)
                                    .foregroundColor(Color.black)
                                    .padding(.horizontal)
                            }
                        }
                    }
                    NavigationLink(destination: GordanView()){
                        ZStack{
                            Rectangle().fill(Color.white).cornerRadius(20).opacity(0.7).frame(width: 370, height: 100)
                            HStack{
                                Image("Gordan").resizable().aspectRatio(contentMode: .fit).padding(.trailing).frame(width: 140, height: 100)
                                VStack{
                                    Text("Gordan's Bay")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.black)
                                        .multilineTextAlignment(.leading)
                                    Text("Clovelly")
                                        .font(.body).foregroundColor(Color.black).padding(.trailing)
                                }
                                Text(">")
                                    .font(.title)
                                    .foregroundColor(Color.black)
                                    .padding(.horizontal)
                            }
                        }
                    }
                    NavigationLink(destination: HarbourView()){
                        ZStack{
                            Rectangle().fill(Color.white).cornerRadius(20).opacity(0.7).frame(width: 370, height: 100)
                            HStack{
                                Image("Harbour").resizable().aspectRatio(contentMode: .fit).padding(.leading).frame(width: 140, height: 100)
                                VStack{
                                    Text("Beulah St Wharf")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.black)
                                        .multilineTextAlignment(.leading)
                                    Text("Sydney Harbour")
                                        .font(.body).foregroundColor(Color.black).padding(.trailing)
                                }
                                Text(">")
                                    .font(.title)
                                    .foregroundColor(Color.black)
                                    .padding(.horizontal)
                            }
                        }
                    }
                    NavigationLink(destination: GymeaView()){
                        ZStack{
                            Rectangle().fill(Color.white).cornerRadius(20).opacity(0.7).frame(width: 370, height: 100)
                            HStack{
                                Image("Gymea").resizable().aspectRatio(contentMode: .fit).padding(.trailing).frame(width: 140, height: 100)
                                VStack{
                                    Text("Gymea Baths")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.black)
                                        .multilineTextAlignment(.leading)
                                    Text("Gymea Bay")
                                        .font(.body).foregroundColor(Color.black).padding(.trailing)
                                }
                                Text(">")
                                    .font(.title)
                                    .foregroundColor(Color.black)
                                    .padding(.horizontal)
                            }
                        }
                    }
                    NavigationLink(destination: ParsleyView()){
                        ZStack{
                            Rectangle().fill(Color.white).cornerRadius(20).opacity(0.7).frame(width: 370, height: 100)
                            HStack{
                                Image("Parsley").resizable().aspectRatio(contentMode: .fit).padding(.trailing).frame(width: 140, height: 100)
                                VStack{
                                    Text("Parsley Bay")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.black)
                                        .multilineTextAlignment(.leading)
                                    Text("Vaucluse")
                                        .font(.body).foregroundColor(Color.black).padding(.trailing)
                                }
                                Text(">")
                                    .font(.title)
                                    .foregroundColor(Color.black)
                                    .padding(.horizontal)
                            }
                        }
                    }
                    Spacer(minLength: 30)
                    Spacer()
                        .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                            Image("home").resizable().aspectRatio(contentMode: .fit).frame(width: 50, height: 60).padding(.top)
                        }

                        Button("Second") {
                            print("Pressed")
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
}
