//
//  VistaDetalle.swift
//  FriendsManagementApp
//
//  Created by Aula03 on 1/10/24.
//

import SwiftUI

struct VistaDetalle: View {
    @EnvironmentObject private var modeloDatos: ModeloDatos
    var amigoCurrent: Amigo
    var body: some View {
                ZStack {
                    VStack {
                        VistaMapa(latitud: amigoCurrent.latitud, longitud:  amigoCurrent.longitud).frame(height: .infinity).mapStyle(.hybrid)
                        VistaDatos(dato: amigoCurrent)
                            .padding(-10.0)
                    }
                    VistaImagen(imageID: amigoCurrent.imagenID)
                }
            }
}

#Preview {
    VistaDetalle(amigoCurrent: ModeloDatos().arrAmigos[0])
}
