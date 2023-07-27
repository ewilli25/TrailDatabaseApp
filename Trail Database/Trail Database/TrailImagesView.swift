//
//  TrailImagesView.swift
//  Trail Database
//
//  Created by Hunter Webb on 4/20/23.
//

import SwiftUI

struct TrailImagesView: View {
    @EnvironmentObject var trailList: TrailList
    @Binding var isShowing: Bool
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    @State var submitInfo: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                Image(uiImage: self.image)
                    .resizable()
                    .frame(minWidth: 0, maxWidth: .infinity)
                Text("Upload a photo from: ").padding()
                Button(action: {
                    self.isShowPhotoLibrary = true
                }) {
                    HStack {
                        Image(systemName: "photo")
                            .font(.system(size: 20))
                        
                        Text("Photo library")
                            .font(.headline)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.horizontal)
                }
                HStack {
                    NavigationLink(destination: NewTrailInfoView(isShowing: $submitInfo), isActive: $submitInfo) {
                        Text("Submit Photo").onTapGesture {
                            submitInfo = true
                            if let idx = trailList.selected {
                                trailList.list[idx].img = self.image
                            }
                        }
                    }
                    NavigationLink(destination: NewTrailInfoView(isShowing: $submitInfo), isActive: $submitInfo) {
                        Text("View Info Page").onTapGesture {
                            submitInfo = true
                        }
                    }
                }
            }.sheet(isPresented: $isShowPhotoLibrary) {
                ImagePicker(source: .photoLibrary, selected: self.$image)
            }
        }
    }
}


