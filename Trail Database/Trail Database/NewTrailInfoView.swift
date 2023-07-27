//
//  NewTrailInfoView.swift
//  Trail Database
//
//  Created by Emma Williamson on 4/26/23.
//

import Foundation
import SwiftUI

struct NewTrailInfoView: View {
    @EnvironmentObject var trailList: TrailList
    @Binding var isShowing: Bool
    
    var body: some View {
        if let idx = trailList.selected {
            VStack {
                Text(trailList.list[idx].notes)
               //let str = trailList.list[idx].url
               //URL(string: str))
                Text(trailList.list[idx].url)
                Image(uiImage: trailList.list[idx].img)
                    .resizable()
                    .frame(width: 300.0, height: 300.0)
            }
        }
    }
}
