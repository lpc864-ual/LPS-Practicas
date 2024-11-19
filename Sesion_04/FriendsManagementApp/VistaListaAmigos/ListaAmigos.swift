//
//  ListaAmigos.swift
//  FriendsManagementApp
//
//  Created by Aula03 on 8/10/24.
//

import SwiftUI

struct BusquedaView: View {
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(text.isEmpty ? Color.gray.opacity(0.4) : Color.gray.opacity(0.9))
            
            TextField("Buscar...", text: $text)
                .padding(.horizontal, 8)
            
            Button(action: { text = ""}) {
                Image(systemName: "x.circle")
                    .opacity(text.isEmpty ? 0.0 : 1.0)
                    .foregroundColor(Color.gray)
            }
        }
        .padding() // Espaciado alrededor del HStack
        .background(Color(.systemGray6)) // Fondo gris claro
        .cornerRadius(10) // Bordes redondeados
        .padding(.horizontal) // Margen horizontal
        .shadow(radius: 2) // Sombra para un efecto más agradable
    }
}

struct ListaAmigos: View {
    @EnvironmentObject var modeloDatos: ModeloDatos
    @State var soloFavoritos = false
    @State var query: String = ""
    @State var enEdicion: Bool = false
    @State var mostrarAddAmigo: Bool = false
    @State var nombre: String = ""
    @State var telefono: String = ""
    @State var email: String = ""
    @State var imagenID: String = ""
    @State var cancelAddAmigo: Bool = false
    var body: some View {
        NavigationView {
            VStack{
                BusquedaView(text: $query)
                List(){
                    Toggle(isOn: $soloFavoritos) {
                        Text("Mostrar solo los favoritos")
                    }
                    ForEach(modeloDatos.arrAmigos){ amigoCurrent in
                        if (!soloFavoritos || amigoCurrent.favorito) &&
                            (query.isEmpty || amigoCurrent.nombre.lowercased().contains(query.lowercased())){
                            NavigationLink(destination: VistaDetalle(amigoCurrent: amigoCurrent)) {
                                VistaFila(amigoCurrent: amigoCurrent)
                            }
                        }
                    }.onDelete{ indexSet in
                        modeloDatos.arrAmigos.remove(atOffsets: indexSet)
                    }
                    .onMove { indices, newOffset in
                        modeloDatos.arrAmigos.move(fromOffsets: indices, toOffset: newOffset)
                    }
                    
                }.environment(\.editMode, .constant(enEdicion ? EditMode.active : EditMode.inactive))
            }
            .navigationTitle("Amigos")
            .navigationBarItems(
                leading:
                    Button {
                        enEdicion.toggle()
                    } label: {
                        Text(enEdicion ? "Cancelar" : "Editar")
                            .font(.title)
                            .foregroundColor(Color.blue)
                            .shadow(color: Color(red: 0.28, green: 0.855, blue: 0.92), radius: 9)
                    },
                trailing:
                    Button() {
                        mostrarAddAmigo.toggle()
                        nombre = ""
                        telefono = ""
                        email = ""
                        imagenID = "Person"
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.title)
                            .foregroundColor(Color.red)
                            .shadow(color: Color.pink, radius: 9)
                    }
                    .sheet(isPresented: $mostrarAddAmigo,
                           onDismiss: {
                               if !cancelAddAmigo {
                                   modeloDatos.arrAmigos.append((Amigo(nombre: nombre.isEmpty ? "nuevoAmigo" : nombre, telefono: telefono.isEmpty ? "777777777" : telefono, email: email.isEmpty ? "nuevoAmigo@gmail.com" : email, imagenID: imagenID)))
                               }
                           }, content: {
                               VistaAddAmigo(nombre: $nombre, telefono: $telefono, email: $email, imagenID: $imagenID, cancelar: $cancelAddAmigo)
                           })
            )
        }
    }
}

#Preview {
    ListaAmigos()
        .environmentObject(ModeloDatos())
}
