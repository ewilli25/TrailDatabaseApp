//
//  TrailInfoView.swift
//  Trail Database
//
//  Created by Hunter Webb on 4/20/23.
//

import SwiftUI

enum FocusableField: Hashable {
  case notes
  case siteLink
}

struct TrailInfoView: View {
    @Binding var isShowing: Bool
    @State var notes: String = ""
    @State var siteLink: String = ""
    @EnvironmentObject var trailList: TrailList
    @State var submitInfo: Bool = false
    
  /*  func getTrailName() -> String {
        if let idx = trailList.selected {
            return trailList.list[idx].name
        }
        return "No selection"
    }*/
    
    var body: some View {
        NavigationView {
            VStack{
                TextField("Notes", text: $notes).padding()
                TextField("URL", text: $siteLink).padding()
                NavigationLink(destination: NewTrailInfoView(isShowing: $submitInfo), isActive: $submitInfo) {
                    Text("Submit Info").onTapGesture {
                        submitInfo = true
                        if let idx = trailList.selected {
                            trailList.list[idx].notes = notes
                            trailList.list[idx].url = siteLink
                        }
                    }
                }
                NavigationLink(destination: NewTrailInfoView(isShowing: $submitInfo), isActive: $submitInfo) {
                    Text("View Info Page").onTapGesture {
                        submitInfo = true
                    }
                }
            }
        }
    }
    
}

