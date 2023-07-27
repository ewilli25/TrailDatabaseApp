//
//  AddParkView.swift
//  Trail Database
//
//  Created by Hunter Webb on 4/10/23.
//

import SwiftUI

struct AddTrailView: View {
    @EnvironmentObject var trailList: TrailList
    
    @State var newTrail: String = ""
    @State var newLocationStr: String = ""
    @State var newLocation: String? = nil
    @State var trailLocationAction = false
    @State var addingLocation: Bool = false
    @State var newParkStr: String = ""
    @State var newPark: String? = nil
    @State var trailParkAction = false
    @State var addingPark: Bool = false
    
    @Binding var isShowing: Bool
    
    var haveLocations: Bool {
        let aLocations = UserDefaults.standard.array(forKey: locationsKey)
        if let locations = aLocations {
            if locations.isEmpty {
                return false
            }
            return true
        }
        return false
    }
    
    var currentLocation: String {
        newLocation ?? "Select Location"
    }
    
    func allLocations() -> [ActionSheet.Button] {
        var retval: [ActionSheet.Button] = []
        let aLocations: [Any]? = UserDefaults.standard.array(forKey: locationsKey)
        if let locations = aLocations {
            for loc in locations {
                if let l = loc as? String {
                    retval.append(.default(Text(l)){
                        newLocation = l
                    })
                }
            }
        }
        return retval
    }
    
    var haveParks: Bool {
        let aParks = UserDefaults.standard.array(forKey: parksKey)
        if let parks = aParks {
            if parks.isEmpty {
                return false
            }
            return true
        }
        return false
    }
    
    var currentPark: String {
        newPark ?? "Select Park"
    }
    
    func allParks() -> [ActionSheet.Button] {
        var retval: [ActionSheet.Button] = []
        let aParks: [Any]? = UserDefaults.standard.array(forKey: parksKey)
        if let parks = aParks {
            for par in parks {
                if let p = par as? String {
                    retval.append(.default(Text(p)){
                        newPark = p
                    })
                }
            }
        }
        return retval
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Enter new trail:").padding()
                TextField("new trail", text: $newTrail).padding()
            }
            Button(currentPark){ trailParkAction = true}.actionSheet(isPresented: $trailParkAction) {
                ActionSheet(
                    title: Text("Select Park"),
                    message: Text("Please choose one of these"),
                    buttons: allParks()
                )}.disabled(!haveParks)
            Button(currentLocation){ trailLocationAction = true}.actionSheet(isPresented: $trailLocationAction) {
                ActionSheet(
                    title: Text("Select Location"),
                    message: Text("Please choose one of these"),
                    buttons: allLocations()
                )}.disabled(!haveLocations)
            NavigationLink(destination: AddParkView(isShowing: $addingPark), isActive: $addingPark) {
                Text("Add New Park").onTapGesture {
                    addingPark = true
                }
            }
            NavigationLink(destination: AddLocationView(isShowing: $addingLocation), isActive: $addingLocation) {
                Text("Add New Location").onTapGesture {
                    addingLocation = true
                }
            }
            Button("Add") {
                if let loc = newLocation, let par = newPark {
                    trailList.addTrail(trail: Trail(name: newTrail, parkName: par, location: loc, overallRating: 0, hiked: false, ran: false, biked: false, bikeRating: 0, hikeRating: 0, runRating: 0, notes: "", url: "", img: UIImage()))
                    newTrail = ""
                    newLocation = nil
                    newPark = nil
                }
            }
        }
    }
}
