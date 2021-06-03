//
//  CameraView.swift
//  Fish Spot
//
//  Created by Sebastian Baldwin on 2/4/21.
//

import SwiftUI
import Foundation




struct CameraView: View {
    
    
    @State private var showSheet: Bool = false // show image upload options
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    @State private var image: UIImage? // image display
    
    
    @State var bream = false       // displaying correct page for fish species
    @State var flathead = false
    @State var flounder = false
    @State var kingfish = false
    @State var tuna = false
    @State var snapper = false
    
    @State var showLoad = false // loading circle
    
    var body: some View {
        

            
            ZStack {
                Image("background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
                
                VStack{
                    Spacer()
                    Spacer()
                    Image(uiImage: image ?? UIImage(named:  "placehold")!).resizable().aspectRatio(contentMode: .fit).padding().offset(y: 30) // Image updates to uploaded image
                    Spacer()
                    Spacer()
                    Spacer()
                    Button("Take/Select Photo"){ // Button: upload photo
                        self.showSheet = true
                    }.padding().offset(y: 70).foregroundColor(Color.white).background(Color("homebutton").opacity(0.6).cornerRadius(10.0).offset(y: 70)).actionSheet(isPresented: $showSheet) {
                        ActionSheet(title: Text("Select Photo"), message: Text("Choose"), buttons: [
                            .default(Text("Photo Library")) {
                                self.showImagePicker = true
                                self.sourceType = .photoLibrary // select from photo library
                            },
                            .default(Text("Camera")) {
                                self.showImagePicker = true
                                self.sourceType = .camera //select from phone camera
                            },
                            .cancel()
                        ])
                    }
                    
                    Button("Verify"){ // upload photo to api
                        
                        if image != nil{
                            showLoad = true

                            let imageData: Data = image?.jpegData(compressionQuality: 0.1) ?? Data() // converts image to base64
                            let imageStr: String = imageData.base64EncodedString()
                            let url = URL(string: "https://api.ximilar.com/recognition/v2/classify/")! // endpoint of Api
                            var request = URLRequest(url: url)
                            
                            
                            request.setValue("application/json", forHTTPHeaderField: "Content-Type") // header: allows access to api and specific task
                            request.setValue("Token e1d76c02cd89b93334e5359290247a8c4d24c9fa", forHTTPHeaderField: "Authorization")
                            
                            let body: [String: Any] = [ // data sent to the api
                                "task_id" : "c03c288b-a249-4b17-9f63-974c2f30beb9",
                                "records" : [
                                    [
                                        "_base64": imageStr
                                    ]
                                ]
                            ]
                            let bodyData = try? JSONSerialization.data(withJSONObject: body, options: [])
                            
                            request.httpMethod = "POST"
                            request.httpBody = bodyData
                            
                            
                            let session = URLSession.shared // api request
                            
                            
                            
                            session.dataTask(with: request) { (data, response, error) in
                                    if let response = response {
                                        print(response)
                                    }
                                   if let data = data {
                                        do {
                                            
                                            let ximilar = try? JSONDecoder().decode(XimilarData.self, from: data)
                                            let condition = ximilar!.records.first?.bestLabel.name // finds value of best_label and changes value based on that
                                            if condition == "Flounder"{
                                                flounder = true
                                            } else if condition == "Flathead"{
                                                flathead = true
                                            } else if condition == "Yellowtail Kingfish"{
                                                kingfish = true
                                            } else if condition == "Snapper"{
                                                snapper = true
                                            } else if condition == "Bream"{
                                                bream = true
                                            } else if condition == "Tuna"{
                                                tuna = true
                                            }
                                        }
                                    }
                               
                           }.resume()
                        } else {
                            print("upload image")
                        }
                        
                    }.padding().offset(y: 70).foregroundColor(.white).background(Color("homebutton").opacity(0.6).cornerRadius(10.0).frame(width: 170).offset(y: 70))
                    
                    
                    
                    
                    
                    // navigation bar at bottom of screen
                    ZStack{
                        Rectangle().fill(Color.blue).cornerRadius(40).frame(height: 220).offset(y: 100).padding(.top).opacity(0.5)
                        VStack(spacing: 40){
                            Text("Hello world").opacity(0)
                            HStack(spacing: 10){
                                Spacer()
                                NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                                    Image("home").resizable().aspectRatio(contentMode: .fit).frame(width: 50, height: 60).padding(.top)
                                }
                                VStack{
                                    Image("camera").resizable().aspectRatio(contentMode: .fit).frame(width:50, height: 60).padding(.top).offset(y: 15)
                                    Circle().fill(Color.green).frame(width: 20, height: 20).opacity(0.3).offset(y: 10)
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
                                NavigationLink(destination: FishingspotView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
                                    Image("map").resizable().aspectRatio(contentMode: .fit).frame(width:50, height: 60).padding(.top)
                                }
                                Spacer(minLength: 20)
                            }
                        }
                    }
                }
                if showLoad {             // loads page depending on bool value
                    loadingCircleView()
                }
            
                if flathead {
                    FlatheadView()

                } else if flounder {
                    FlounderView()
 
                } else if tuna {
                    TunaView()
                    
                } else if kingfish {
                    KingfishView()
                    
                } else if snapper {
                    SnapperView()
                    
                } else if bream {
                    BreamView()
            
                }
                
            }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType) // option to select camera or photo library
        }
    }
}


struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
            .previewDevice("iPhone 12")
    }
}


// views for different fish



struct breamView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Image("background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
                
                VStack{
                    Image("bream").resizable().aspectRatio(contentMode: .fit).frame(width: 300, height: 140)
                    
                    ZStack{
                        Rectangle().fill(Color.white).cornerRadius(40).frame(width: 350, height: 325).opacity(0.7)
                    }
                    Spacer(minLength: 20)
                    

                    ZStack{
                        Rectangle().fill(Color.blue).cornerRadius(40).frame(height: 160).offset(y: 1).padding(.top).opacity(0.5)
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
                                NavigationLink(destination: WeatherView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
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
                            Text("ok").opacity(0).padding()
                        }
                    }
                }
                
            }
        }
    }
}


struct flatheadView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Image("background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
                
                VStack{
                    Image("flathead").resizable().aspectRatio(contentMode: .fit).frame(width: 300, height: 140)
                    
                    ZStack{
                        Rectangle().fill(Color.white).cornerRadius(40).frame(width: 350, height: 325).opacity(0.7)
                    }
                    Spacer(minLength: 20)
                    ZStack{
                        Rectangle().fill(Color.blue).cornerRadius(40).frame(height: 160).offset(y: 1).padding(.top).opacity(0.5)
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
                                NavigationLink(destination: WeatherView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
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
                            Text("ok").opacity(0).padding()
                        }
                    }
                }
                
            }
        }
    }
}

struct flounderView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Image("background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
                
                VStack{
                    Image("flounder").resizable().aspectRatio(contentMode: .fit).frame(width: 300, height: 140)
                    
                    ZStack{
                        Rectangle().fill(Color.white).cornerRadius(40).frame(width: 350, height: 325).opacity(0.7)
                    }
                    Spacer(minLength: 20)
                    ZStack{
                        Rectangle().fill(Color.blue).cornerRadius(40).frame(height: 160).offset(y: 1).padding(.top).opacity(0.5)
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
                                NavigationLink(destination: WeatherView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
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
                            Text("ok").opacity(0).padding()
                        }
                    }
                }
                
            }
        }
    }
}

struct kingfishView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Image("background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
                
                VStack{
                    
                    Image("kingfish").resizable().aspectRatio(contentMode: .fit).frame(width: 300, height: 140).rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    
                    ZStack{
                        Rectangle().fill(Color.white).cornerRadius(40).frame(width: 350, height: 325).opacity(0.7)
                    }
                    Spacer(minLength: 20)
                    ZStack{
                        Rectangle().fill(Color.blue).cornerRadius(40).frame(height: 160).offset(y: 1).padding(.top).opacity(0.5)
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
                                NavigationLink(destination: WeatherView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
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
                            Text("ok").opacity(0).padding()
                        }
                    }
                }
                
            }
        }
    }
}

struct snapperView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Image("background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
                
                VStack{
                    Image("snapper").resizable().aspectRatio(contentMode: .fit).frame(width: 300, height: 140)
                    
                    ZStack{
                        Rectangle().fill(Color.white).cornerRadius(40).frame(width: 350, height: 325).opacity(0.7)
                    }
                    Spacer(minLength: 20)
                    ZStack{
                        Rectangle().fill(Color.blue).cornerRadius(40).frame(height: 160).offset(y: 1).padding(.top).opacity(0.5)
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
                                NavigationLink(destination: WeatherView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
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
                            Text("ok").opacity(0).padding()
                        }
                    }
                }
                
            }
        }
    }
}

struct tunaView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Image("background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
                
                VStack{
                    Image("tuna").resizable().aspectRatio(contentMode: .fit).frame(width: 300, height: 140).rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    
                    ZStack{
                        Rectangle().fill(Color.white).cornerRadius(40).frame(width: 350, height: 325).opacity(0.7)
                    }
                    Spacer(minLength: 20)
                    ZStack{
                        Rectangle().fill(Color.blue).cornerRadius(40).frame(height: 160).offset(y: 1).padding(.top).opacity(0.5)
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
                                NavigationLink(destination: WeatherView().navigationBarBackButtonHidden(true).navigationBarHidden(true)){
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
                            Text("ok").opacity(0).padding()
                        }
                    }
                }
                
            }
        }
    }
}



// view for loading bar while waiting for response

struct loadingCircleView: View{
    
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
