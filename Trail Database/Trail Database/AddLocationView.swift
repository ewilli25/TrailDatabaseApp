//
//  AddLocationView.swift
//  Trail Database
//
//  Created by Hunter Webb on 4/10/23.
//

import SwiftUI

struct AddLocationView: View {
    @State var newLocationStr: String = ""
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("New Location:").padding()
                TextField("new location", text: $newLocationStr).padding()
            }
            Button("Add Location") {
                var locationList: [String] = []
                locationList.append(newLocationStr)
                let curLocs = UserDefaults.standard.array(forKey: locationsKey)
                if let locations = curLocs {
                    for loc in locations {
                        if let l = loc as? String {
                            locationList.append(l)
                        }
                    }
                }
                UserDefaults.standard.set(locationList, forKey: locationsKey)
                newLocationStr = ""
            }.font(.caption).padding()
            Button("Clear Locations") {
                UserDefaults.standard.removeObject(forKey: locationsKey)
                newLocationStr = "[clearing]"
                newLocationStr = ""
            }.font(.caption).padding()
        }
    }
}


