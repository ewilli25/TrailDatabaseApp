//
//  ParkList.swift
//  Trail Database
//
//  Created by Hunter Webb on 3/24/23.
//

import Foundation
import SwiftUI

struct Trail: Hashable, Equatable {
    var name: String
    var location: String
    var parkName: String
    var hiked: Bool
    var ran: Bool
    var biked: Bool
    var overallRating: Int
    var hikeRating: Int
    var runRating: Int
    var bikeRating: Int
    var notes: String
    var url: String //might need to change to URL
    var img: UIImage
    
    init(name: String, parkName: String, location: String, overallRating: Int, hiked: Bool, ran: Bool, biked: Bool, bikeRating: Int, hikeRating: Int, runRating: Int, notes: String, url: String, img: UIImage) {
            self.name = name
            self.parkName = parkName
            self.location = location
            self.overallRating = overallRating
            self.hiked = hiked
            self.ran = ran
            self.biked = biked
            self.bikeRating = bikeRating
            self.hikeRating = hikeRating
            self.runRating = runRating
            self.notes = notes
            self.url = url
            self.img = img
            //self.rating = rating // initialize the new rating property
        }
    
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.name == rhs.name && lhs.location == rhs.location
    }
}

class TrailList: ObservableObject {
    @Published var list: [Trail] = []
    @Published var selected: Int? = nil
    
    func addTrail(trail: Trail) {
        list.append(trail)
    }
    
    func selectTrail(name: String) {
            for i in 0..<list.count {
                if list[i].name == name {
                    selected = i
                }
            }
        }
        
    func unselect() {
        selected = nil
    }
    
    func setHiked(hasHiked: Bool) {
        if let i = selected {
            if i < list.count {
                list[i].hiked = hasHiked
            }
        }
    }
    
    func setRan(hasRan: Bool) {
        if let i = selected {
            if i < list.count {
                list[i].ran = hasRan
            }
        }
    }
    
    func setBiked(hasBiked: Bool) {
        if let i = selected {
            if i < list.count {
                list[i].hiked = hasBiked
            }
        }
    }
    
    func setOverallRating(overallRating: Int) {
        if let i = selected {
            if i < list.count {
                list[i].overallRating = overallRating
            }
        }
    }
    
    func sethikeRating(hikeRating: Int) {
        if let i = selected {
            if i < list.count {
                list[i].hikeRating = hikeRating
            }
        }
    }
    
    func setRunRating(runRating: Int) {
        if let i = selected {
            if i < list.count {
                list[i].runRating = runRating
            }
        }
    }
    
    func setBikeRating(bikeRating: Int) {
        if let i = selected {
            if i < list.count {
                list[i].bikeRating = bikeRating
            }
        }
    }
    
    func setNotes(notes: String) {
        if let i = selected {
            if i < list.count {
                list[i].notes = notes
            }
        }
    }
    
    func setURL(url: String) {
        if let i = selected {
            if i < list.count {
                list[i].url = url
            }
        }
    }
    
    func setImage(img: UIImage) {
        if let i = selected {
            if i < list.count {
                list[i].img = img
            }
        }
    }
}
