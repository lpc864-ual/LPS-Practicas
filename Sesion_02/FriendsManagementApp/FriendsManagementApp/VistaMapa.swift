//
//  VistaMapa.swift
//  FriendsManagementApp
//
//  Created by Aula03 on 1/10/24.
//

import SwiftUI
import MapKit

struct VistaMapa: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 36.8304668189410, longitude: -2.4060252816326977),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    var body: some View {
        Map(coordinateRegion: $region)
            .frame(height: 250).ignoresSafeArea()
    }
}

#Preview {
    VistaMapa()
}
