//
//  LawView.swift
//  Fish Spot
//
//  Created by Sebastian Baldwin on 2/4/21.
//

import SwiftUI

struct LawView: View {
    
    @State var animate = false
    
    var body: some View {
        VStack{
            Circle().trim(from: 0, to: 0.8).stroke(AngularGradient(gradient: .init(colors: [.blue, .green]),center: .center),style: StrokeStyle(lineWidth: 8, lineCap: .round)).frame(width: 45, height: 45).rotationEffect(.init(degrees: self.animate ? 360:0)).animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false))
        }.onAppear{
            self.animate.toggle()
        }
            
        
    }
}

struct LawView_Previews: PreviewProvider {
    static var previews: some View {
        LawView()
    }
}
