//
//  MapView.swift
//  Trail Database
//
//  Created by Hunter Webb on 4/25/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var mapModel = MapViewModel()
    
    var body: some View {
        Map(coordinateRegion: $mapModel.region, showsUserLocation: true)
            .onAppear {
            mapModel.userLocation()
            }
    }
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 38.989697, longitude: -76.937759),
                                               span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    
    
    let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func userLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let newRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 300, longitudinalMeters: 300)
        region = newRegion
    }
}
