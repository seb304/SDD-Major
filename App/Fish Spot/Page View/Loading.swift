//
//  Loading.swift
//  Fish Spot
//
//  Created by Sebastian Baldwin on 23/5/21.
//

import SwiftUI

struct Loading: View {
    @State var animate = false
    
    var body: some View{
        
        ZStack{
            Image("background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea().opacity(0.7)
            ZStack{
                Rectangle().frame(width: 100, height: 100).foregroundColor(Color.white).cornerRadius(10).opacity(0.8)
                VStack{
                    Circle().trim(from: 0, to: 0.8).stroke(AngularGradient(gradient: .init(colors: [.blue, .green]),center: .center),style: StrokeStyle(lineWidth: 8, lineCap: .round)).frame(width: 45, height: 45).rotationEffect(.init(degrees: self.animate ? 360:0)).animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false))
                    Text("Loading...").foregroundColor(Color("homebutton")) // spinning circle
            }
            }.onAppear{
                self.animate.toggle()
            }
        }
        
        
        
    }
}

struct Loading_Previews: PreviewProvider {
    static var previews: some View {
        Loading()
    }
}
