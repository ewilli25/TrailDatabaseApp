//
//  ParkView.swift
//  Trail Database
//
//  Created by Hunter Webb on 3/25/23.
//

import SwiftUI

struct TrailView: View {
    @EnvironmentObject var trailList: TrailList
    @State var gettingInfo: Bool = false
    @State var showingImages: Bool = false
    
    func getTrailName() -> String {
        if let idx = trailList.selected {
            return trailList.list[idx].name
        }
        return "No Selection"
    }
    
    func getParkLocation() -> String {
        if let idx = trailList.selected {
            return trailList.list[idx].location
        }
        return "No Selection"
    }
    
    func getParkName() -> String {
        if let idx = trailList.selected {
            return trailList.list[idx].parkName
        }
        return "No Selection"
    }

    var body: some View {
        NavigationView {
            VStack {
                Text("Trail Details")
                    .fontWeight(.bold)
                    .font(.title2)
                    .padding()
                if let idx = trailList.selected {
                    Group {
                        HStack {
                            Text("Trail Name").padding()
                            Spacer()
                            Text(trailList.list[idx].name).padding()
                        }
                        HStack {
                            Text("Park Name").padding()
                            Spacer()
                            Text(trailList.list[idx].parkName).padding()
                        }
                        HStack {
                            Text("Location").padding()
                            Spacer()
                            Text(trailList.list[idx].location).padding()
                        }
                        HStack {
                            Text("Overall Rating").padding()
                            Spacer()
                            RatingView(selected: $trailList.list[idx].overallRating)
                        }
                        Toggle(String("Hiked"), isOn: $trailList.list[idx].hiked).padding()
                        Toggle(String("Ran"), isOn: $trailList.list[idx].ran).padding()
                        Toggle(String("Biked"), isOn: $trailList.list[idx].biked).padding()
                        
                        HStack {
                            NavigationLink(destination: TrailInfoView(isShowing: $gettingInfo)
                                .navigationTitle(Text("Trail Information")),
                                           isActive: $gettingInfo) {
                                Text("Trail Information").onTapGesture {
                                    gettingInfo = true
                                }
                            }
                            Spacer()
                            NavigationLink(destination: TrailImagesView(isShowing: $showingImages)
                                .navigationTitle(Text("Trail Images")),
                                           isActive: $showingImages) {
                                Text("Trail Images").onTapGesture {
                                    showingImages = true
                                }
                            }
                        }
                    }
                } else {
                    Group {
                        Text("No Selection")
                    }
                }
            }
        }
    }
}

