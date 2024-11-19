//
//  VistaMapa.swift
//  FriendsManagementApp
//
//  Created by Aula03 on 1/10/24.
//

import SwiftUI
import MapKit

struct VistaMapa: View {
    var latitud: Double
    var longitud: Double
    @State private var region = MKCoordinateRegion()
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear(){
                region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: latitud, longitude: longitud),
                    span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
            }.ignoresSafeArea()
            
    }
}

#Preview {
    VistaMapa(latitud: 36.8304668189410, longitud:  -2.4060252816326977)
}
