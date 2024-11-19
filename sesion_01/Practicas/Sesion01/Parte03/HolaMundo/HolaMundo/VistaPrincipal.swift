//
//  ContentView.swift
//  HolaMundo
//
//  Created by Aula03 on 24/9/24.
//

import SwiftUI

struct VistaPrincipal: View {
    @State private var nombreUsuario: String = ""
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            VStack {
                Image("logoUAL")
                SaludoText("")
                TextField("Introduzca su nombre", text: $nombreUsuario).padding(.leading).frame(width: 200.0)
                
                Button("Reset") {
                    nombreUsuario = ""
                }
                .disabled(nombreUsuario.isEmpty)
            }
        }
    }
}

#Preview {
    VistaPrincipal()
        .preferredColorScheme(.light)
}
