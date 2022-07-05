//
//  AnnotationItem.swift
//  Runninger
//
//  Created by Cédric Bahirwe on 05/07/2022.
//

import CoreLocation

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}
