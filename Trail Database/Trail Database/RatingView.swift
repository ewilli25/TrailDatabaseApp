//
//  RatingView.swift
//  Trail Database
//
//  Created by Hunter Webb on 4/16/23.
//

import SwiftUI

struct RatingView: View {
    @Binding var selected: Int
    
    var body: some View {
        ForEach(0..<5) { rating in
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(self.selected >= rating ? .yellow : .gray)
                .onTapGesture {
                    self.selected = rating
                }
        }
    }
}

/*
struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(selected: 3)
    }
}
*/
