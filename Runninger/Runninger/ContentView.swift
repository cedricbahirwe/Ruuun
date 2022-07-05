//
//  ContentView.swift
//  Runninger
//
//  Created by Cédric Bahirwe on 05/07/2022.
//

import SwiftUI
import CoreLocationUI

struct ContentView: View {
    @StateObject private var locationManager = MapLocationManager()
    var body: some View {
        ZStack {

            MapRunningView(manager: locationManager)

            VStack(alignment: .leading) {
                Text("Let's get started")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)

                LocationButton(.shareMyCurrentLocation) {
                    
                    locationManager.requestLocation()
                }
                .symbolVariant(.fill)
                .labelStyle(.titleAndIcon)
                .padding(.horizontal)
                .frame(height: 50)
                .background(Color.accentColor)
                .clipShape(Capsule())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.ultraThickMaterial)
            .opacity(locationManager.userLocation == nil ? 1 : 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .preferredColorScheme(.dark)
    }
}
