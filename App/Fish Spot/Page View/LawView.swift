//
//  LawView.swift
//  Fish Spot
//
//  Created by Sebastian Baldwin on 2/4/21.
//

import SwiftUI

struct LawView: View {
    var body: some View {
        
        ZStack{
            
            Image("background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
            
            VStack{
                Spacer()
                ZStack{
                    Rectangle().fill(Color.white).opacity(0.7).frame(width: 350, height: 485).cornerRadius(30)
                    
                    VStack{
                        Text("NSW Fishing Laws").font(.title).fontWeight(.bold).foregroundColor(Color.black)
                        Text("OK").opacity(0)
                        HStack{
                            Link(destination: URL(string: "https://www.dpi.nsw.gov.au/fishing/recreational/recreational-fishing-fee")!) {
                                ZStack{
                                    Rectangle().fill(Color("homebutton")).frame(width: 300, height: 55).cornerRadius(15)
                                    HStack{
                                        Text("Fish Licences").font(.title2).fontWeight(.bold).foregroundColor(Color.white)
                                    }
                                }
                            }
                        }
                        HStack{
                            Link(destination: URL(string: "https://www.dpi.nsw.gov.au/fishing/recreational/fishing-rules-and-regs/measure")!) {
                                ZStack{
                                    Rectangle().fill(Color("homebutton")).frame(width: 300, height: 55).cornerRadius(15)
                                    HStack{
                                        Text("How to measure fish").font(.title2).fontWeight(.bold).foregroundColor(Color.white)
                                    }
                                }
                            }
                        }
                        HStack{
                            Link(destination: URL(string: "https://www.dpi.nsw.gov.au/fishing/recreational/fishing-rules-and-regs/saltwater-bag-and-size-limits")!) {
                                ZStack{
                                    Rectangle().fill(Color("homebutton")).frame(width: 300, height: 55).cornerRadius(15)
                                    HStack{
                                        Text("Saltwater fish limits").font(.title2).fontWeight(.bold).foregroundColor(Color.white)
                                    }
                                }
                            }
                        }
                        HStack{
                            Link(destination: URL(string: "https://www.dpi.nsw.gov.au/fishing/recreational/fishing-rules-and-regs/freshwater-bag-and-size-limits")!) {
                                ZStack{
                                    Rectangle().fill(Color("homebutton")).frame(width: 300, height: 55).cornerRadius(15)
                                    HStack{
                                        Text("Freshwater fish limits").font(.title2).fontWeight(.bold).foregroundColor(Color.white)
                                    }
                                }
                            }
                        }
                        HStack{
                            Link(destination: URL(string: "https://www.dpi.nsw.gov.au/fishing/recreational/fishing-rules-and-regs/perm-prohib-saltwater")!) {
                                ZStack{
                                    Rectangle().fill(Color("homebutton")).frame(width: 300, height: 55).cornerRadius(15)
                                    HStack{
                                        Text("Saltwater fishing rules").font(.title2).fontWeight(.bold).foregroundColor(Color.white)
                                    }
                                }
                            }
                        }
                        HStack{
                            Link(destination: URL(string: "https://www.dpi.nsw.gov.au/fishing/recreational/fishing-rules-and-regs/perm-prohib-freshwater")!) {
                                ZStack{
                                    Rectangle().fill(Color("homebutton")).frame(width: 300, height: 55).cornerRadius(15)
                                    HStack{
                                        Text("Freshwater fishing rules").font(.title2).fontWeight(.bold).foregroundColor(Color.white)
                                    }
                                }
                            }
                        }

                        
                    }
                   
                }
                Spacer()
                
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
                            VStack{
                                Image("law").resizable().aspectRatio(contentMode: .fit).frame(width:50, height: 60).padding(.top).offset(y: 14)
                                Circle().fill(Color.green).frame(width: 20, height: 20).opacity(0.3).offset(y: 10)
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

struct LawView_Previews: PreviewProvider {
    static var previews: some View {
        LawView()
    }
}
