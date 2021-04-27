//
//  CameraView.swift
//  App
//
//  Created by Sebastian Baldwin on 22/3/21.
//

import SwiftUI

struct CameraView: View {
    
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    @State private var image: UIImage?
    
    var body: some View {
        
        NavigationView{
            
            ZStack {
                Image("background").resizable().aspectRatio(contentMode: .fill).padding().frame(width: 1200, height: 1200.0)
                
                VStack{
                    
                    Image("imagehold").resizable().frame(width: 300, height: 300).padding().aspectRatio(contentMode: .fit)
                    
                    Button("Take/Select Photo"){
                        self.showSheet = true
                    }.padding().actionSheet(isPresented: $showSheet) {
                        ActionSheet(title: Text("Select Photo"), message: Text("Choose"), buttons: [
                            .default(Text("Photo Library")) {
                                self.showImagePicker = true
                                self.sourceType = .photoLibrary
                            },
                            .default(Text("Camera")) {
                                self.showImagePicker = true
                                self.sourceType = .camera
                            },
                            .cancel()
                        ])
                    }
                }
            }
        }.sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
        }
    }
    
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
