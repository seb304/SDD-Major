//
//  CameraView.swift
//  Fish Spot
//
//  Created by Sebastian Baldwin on 2/4/21.
//

import SwiftUI
import Foundation


struct CameraView: View {
    
    @State private var showSheet: Bool = false // boolean value 
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    @State private var image: UIImage? // image displayed on screen
    

    
    var body: some View {
        

            
            ZStack { // arranges contents in the z-axis
                Image("background").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea() // background image
                
                VStack{ // arranges contents in vertical order
                    Spacer()
                    Spacer()
                    Image(uiImage: image ?? UIImage(named:  "placehold")!).resizable().aspectRatio(contentMode: .fit).padding().offset(y: 30) // Placehold image which changes to users selected photo
                    Spacer()
                    Spacer()
                    Spacer()
                    Button("Take/Select Photo"){ // button to upload a photo either through their camera or photo library
                        self.showSheet = true
                    }.padding().offset(y: 70).foregroundColor(Color.white).background(Color("homebutton").opacity(0.6).cornerRadius(10.0).offset(y: 70)).actionSheet(isPresented: $showSheet) {
                        ActionSheet(title: Text("Select Photo"), message: Text("Choose"), buttons: [
                            .default(Text("Photo Library")) {
                                self.showImagePicker = true
                                self.sourceType = .photoLibrary // button which takes user to their photo library
                            },
                            .default(Text("Camera")) {
                                self.showImagePicker = true
                                self.sourceType = .camera //button which takes user to camera
                            },
                            .cancel()
                        ])
                    }
                    
                    Button("Verify"){ // upload users image to AI service (ximilar)
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
                                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                                        print(json)
                                        
                                    } catch {
                                        print(error) // prints error
                                    }
                                }
                           
                        }.resume()
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
