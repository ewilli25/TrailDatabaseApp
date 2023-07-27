//
//  ContentView.swift
//  Trail Database
//
//  Created by Hunter Webb on 3/24/23.
//

import SwiftUI

let locationsKey = "locations"
let parksKey = "parks"

struct TrailLineView: View {
    @EnvironmentObject var parkList: TrailList

    let trail: Trail
    
    init (trail: Trail) {
        self.trail = trail
    }
    var body: some View {
        HStack {
            Text(trail.name)
                    Spacer()
            Text(String("\(trail.parkName)"))
                }

    }
}

struct ContentView: View {
    @EnvironmentObject var trailList: TrailList
    
    var body: some View {
        VStack {
            Text("Trail Boss").padding().font(.title)
                .foregroundColor(.brown)
                .padding()
            TabView {
                MainView()
                    .environmentObject(trailList)
                    .tabItem {Text("Trails")}
                TrailView()
                    .environmentObject(trailList)
                    .tabItem {Text("Trail Details")}
                CompassView()
                    .tabItem {Text("Compass")}
                MapView()
                    .tabItem {Text("Map")}
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(TrailList())
    }
}
