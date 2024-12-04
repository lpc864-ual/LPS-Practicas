//
//  VistaPrincipal.swift
//  HolaMundo
//
//  Created by Aula03 on 24/9/24.
//


import SwiftUI

struct VistaPrincipal: View {
    @State private var nombreUsuario: String = ""
    @State private var apellidoUsuario: String = ""
    var msg: String {
            if nombreUsuario.isEmpty && apellidoUsuario.isEmpty {
                return "Hola, ¿qué tal?"
            } else {
                return "Hola, \(nombreUsuario) \(apellidoUsuario)"
            }
        }
    
    var body: some View {
        ZStack {
            Color.orange
            .ignoresSafeArea()
            VStack {
                Image("logoUAL")
                Text(msg)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(Color.blue)
                    .padding()
               
                HStack {
                    Text("Nombre: ").bold()
                    TextField("Introduzca su nombre", text: $nombreUsuario)}
                HStack {
                    Text("Apellido: ").bold()
                TextField("Introduzca su apellido", text: $apellidoUsuario)
                }
                Button(action: {nombreUsuario = ""
                    apellidoUsuario=""}) {
                    Text("Reset")
                    }.disabled(nombreUsuario.isEmpty && apellidoUsuario.isEmpty)
                
            }
            .padding()
        }}
}

#Preview {
    VistaPrincipal()
}
