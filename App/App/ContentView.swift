//
//  ContentView.swift
//  App
//
//  Created by Sebastian Baldwin on 16/3/21.
//

import SwiftUI
import SwiftUIFontIcon

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("background").resizable().aspectRatio(contentMode: .fill).padding().frame(width: 1200, height: 1200.0)
            VStack {
                Spacer()
                Spacer()
                Image("logo").resizable().aspectRatio(contentMode: .fit).frame(width: 900, height: 480).padding()
                NavigationLink(destination: CameraView().navigationBarBackButtonHidden(true)){
                    ZStack {
                        Image("button").padding().aspectRatio(contentMode: .fit).frame(width: 150, height: 60).cornerRadius(5.0)
                        Text("Camera").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title).padding().foregroundColor(Color.white)
                        }
                    }
                NavigationLink(destination: CollectionView().navigationBarBackButtonHidden(true)){
                    ZStack {
                        Image("button").padding().aspectRatio(contentMode:  .fit).frame(width: 125, height: 50).cornerRadius(5.0)
                        Text("Collection").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.title2).padding().foregroundColor(Color.white)
                    }
                }
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }
}
}
