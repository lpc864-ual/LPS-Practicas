//
//  VistaMain.swift
//  FriendsManagementApp
//
//  Created by Aula03 on 15/10/24.
//

import SwiftUI

struct VistaMain: View {
    @EnvironmentObject var modeloDatos: ModeloDatos
    @State var seleccion: Int = 0
    var body: some View {
        TabView(selection: $seleccion){
            VistaIdentificacion()
                .tabItem{
                    Image(systemName: "signature")
                    Text("Identificacion")
                }
                .tag(0)
            ListaAmigos().environmentObject(modeloDatos)
                .tabItem{
                    Image(systemName: "bell")
                    Text("Lista de Amigos")
                }
                .tag(1)
            VistaChat().environmentObject(modeloDatos)
                .tabItem{
                    Image(systemName: "person.3")
                    Text("Chat")
                }
                .tag(2)
        }
    }
}

#Preview {
    VistaMain()
        .environmentObject(ModeloDatos())
}
