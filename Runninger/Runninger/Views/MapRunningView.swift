//
//  MapRunningView.swift
//  Runninger
//
//  Created by Cédric Bahirwe on 05/07/2022.
//

import SwiftUI
import MapKit

struct MapRunningView: View {
    @ObservedObject var manager: MapLocationManager
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Map(coordinateRegion: $manager.region,
                interactionModes: [.all],
                showsUserLocation: true,
                userTrackingMode: $manager.userTrackingMode,
                annotationItems: manager.pointsOfInterest) { item in
                MapMarker(coordinate: item.coordinate, tint: .red)

                //            MapAnnotation(coordinate: item.coordinate) {
                //                RoundedRectangle(cornerRadius: 5.0)
                //                    .stroke(Color.purple, lineWidth: 4.0)
                //                    .frame(width: 30, height: 30)
                //            }
                //            AnnotatedItem(name: annotation.name, coordinate: annotation.coordinate)
            }

                .ignoresSafeArea()
            Button(action:  {
                withAnimation {
                    manager.setRegionToUserLocation()
                }
            }) {
                Label {
                    Text("Zoom to user")
                } icon: {
                    Image(systemName: "location.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45)
                }
                .labelStyle(.iconOnly)
            }
            .padding()
        }

    }
}

struct MapRunningView_Previews: PreviewProvider {
    static var previews: some View {
        MapRunningView(manager: MapLocationManager())
    }
}
