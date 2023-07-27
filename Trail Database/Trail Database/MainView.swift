//
//  MainView.swift
//  Trail Database
//
//  Created by Hunter Webb on 4/10/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var trailList: TrailList
    @State var addingTrail: Bool = false
    @State var addingLocation: Bool = false
    @State var addingPark: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                List(trailList.list, id:\.self) {
                    trail in TrailLineView(trail:trail).environmentObject(trailList).onTapGesture {
                        trailList.selectTrail(name: trail.name)
                    }
                }
                Spacer()
                NavigationLink(destination: AddTrailView(isShowing: $addingTrail)
                    .environmentObject(trailList)
                    .navigationTitle(Text("Add Trail")),
                isActive: $addingTrail) {
                    Text("Add Trail").onTapGesture {
                        addingTrail = true
                    }
                    }
                NavigationLink(destination: AddLocationView(isShowing: $addingLocation)
                    .navigationTitle(Text("Add Location")),
                isActive: $addingLocation) {
                        Text("Add Location").onTapGesture {
                            addingLocation = true
                        }
                    }
                NavigationLink(destination: AddParkView(isShowing: $addingPark)
                    .navigationTitle(Text("Add Park")),
                isActive: $addingPark) {
                        Text("Add Park").onTapGesture {
                            addingPark = true
                        }
                    }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(TrailList())
    }
}
