//
//  VistaDetalle.swift
//  FriendsManagementApp
//
//  Created by Aula03 on 1/10/24.
//

import SwiftUI

struct VistaDetalle: View {
    var body: some View {
        ZStack {
            VStack {
                VistaMapa()
                VistaDatos().offset(y:-62)
            }
            VistaImagen()
        }
    }
}

#Preview {
    VistaDetalle()
}
