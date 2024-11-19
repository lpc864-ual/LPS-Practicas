//
//  ListaAmigos.swift
//  FriendsManagementApp
//
//  Created by Aula03 on 8/10/24.
//

import SwiftUI

struct ListaAmigos: View {
    @EnvironmentObject var modeloDatos: ModeloDatos
    @State var soloFavoritos = false
    var body: some View {
        NavigationView {
            List(){
                Toggle(isOn: $soloFavoritos) {
                    Text("Mostrar solo los favoritos")
                }
                ForEach(modeloDatos.arrAmigos){ amigoCurrent in
                    if !soloFavoritos || amigoCurrent.favorito {
                        NavigationLink(destination: VistaDetalle(amigoCurrent: amigoCurrent)) {
                            VistaFila(amigoCurrent: amigoCurrent)
                        }
                    }
                }
            }
            .navigationTitle("Amigos")
        }
    }
}

#Preview {
    ListaAmigos()
        .environmentObject(ModeloDatos())
}
