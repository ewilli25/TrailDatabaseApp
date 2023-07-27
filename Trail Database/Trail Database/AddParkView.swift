//
//  AddParkView.swift
//  Trail Database
//
//  Created by Hunter Webb on 4/16/23.
//

import SwiftUI

struct AddParkView: View {
    @State var newParkStr: String = ""
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("New Park:").padding()
                TextField("new park", text: $newParkStr).padding()
            }
            Button("Add Park") {
                var parkList: [String] = []
                parkList.append(newParkStr)
                let curPars = UserDefaults.standard.array(forKey: parksKey)
                if let parks = curPars {
                    for par in parks {
                        if let p = par as? String {
                            parkList.append(p)
                        }
                    }
                }
                UserDefaults.standard.set(parkList, forKey: parksKey)
                newParkStr = ""
            }.font(.caption).padding()
            Button("Clear Parks") {
                UserDefaults.standard.removeObject(forKey: parksKey)
                newParkStr = "[clearing]"
                newParkStr = ""
            }.font(.caption).padding()
        }
    }
}
