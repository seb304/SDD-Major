//
//  FlatheadView.swift
//  Fish Spot
//
//  Created by Sebastian Baldwin on 2/4/21.
//

import SwiftUI

struct FlatheadView: View {
    var body: some View {
        ZStack {
            Image("background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
            
            VStack{
                
                Spacer()
                
                Image("flathead").resizable().aspectRatio(contentMode: .fit).frame(width: 300)
                Spacer()
                ZStack{
                    Rectangle().fill(Color.white).cornerRadius(40).frame(width: 350, height: 325).opacity(0.7)
                    
                    VStack(spacing: 20){
                        Text("Flathead").font(.title).fontWeight(.bold).foregroundColor(Color("homebutton")).multilineTextAlignment(.center).offset(y: -10)
                        
                        Text("Size Limit: 33cm").foregroundColor(Color("homebutton")).multilineTextAlignment(.leading).offset(x: -90)
                        
                        Text("Bag Limit: 10").foregroundColor(Color("homebutton")).multilineTextAlignment(.leading).offset(x: -105)
                        
                        Text("Info: Flathead vary from a sandy with brown spots to a dark brown with white spots. They are found in estuaries and costal bays in NSW and more commonly caught during the summer months.").foregroundColor(Color("homebutton")).frame(width: 310, height: 150).multilineTextAlignment(.leading)
                    }
                }
                Spacer(minLength: 20)
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

struct FlatheadView_Previews: PreviewProvider {
    static var previews: some View {
        FlatheadView()
    }
}
