//
//  VistaImagen.swift
//  FriendsManagementApp
//
//  Created by Aula03 on 1/10/24.
//

import SwiftUI

struct VistaImagen: View {
    var imageID: String
    var body: some View {
        Image(imageID)
            .resizable()
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth:2))
            .shadow(color: Color.red, radius: 4)
            .ignoresSafeArea()
    }
}

#Preview {
    VistaImagen(imageID: "messi")
}
