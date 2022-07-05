//
//  MapLocationManager.swift
//  Runninger
//
//  Created by Cédric Bahirwe on 05/07/2022.
//

import Foundation
import MapKit
import SwiftUI

final class MapLocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    @Published var region = MKCoordinateRegion()
    @Published var userTrackingMode: MapUserTrackingMode = MapUserTrackingMode.follow
    let pointsOfInterest = [
        AnnotatedItem(name: "Amahoro Stadium", coordinate: ConstantLocations.amahoroStadium),
        AnnotatedItem(name: "Kiruhura Resto", coordinate: ConstantLocations.kiruhuraRestaurant),
        AnnotatedItem(name: "Canon Kigali", coordinate: ConstantLocations.canonKigali),
        AnnotatedItem(name: "Smart Market", coordinate: ConstantLocations.smartMarket)
    ]

    @Published var userLocation: CLLocationCoordinate2D?

    override init() {
        super.init()
        manager.delegate = self
    }

    func setRegionToUserLocation() {
        guard let userLocation = userLocation else {
            return
        }

        region =  MKCoordinateRegion(
            center: userLocation,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    }

    func requestLocation() {
        guard userLocation == nil else { return }
        manager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = locations.first?.coordinate
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
