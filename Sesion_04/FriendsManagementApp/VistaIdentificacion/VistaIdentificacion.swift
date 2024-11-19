//
//  VistaIdentificacion.swift
//  FriendsManagementApp
//
//  Created by Aula03 on 15/10/24.
//

import SwiftUI

struct VistaIdentificacion: View {
    @AppStorage("userName") var userName: String?
    @State var currentUserName: String = ""
    @State var cambiarNombre: Bool = false
    
    var body: some View {
        VStack {
            Image("welcome")
                .resizable()
                .frame(width: 300, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.white, lineWidth: 2))
                .shadow(color: Color.gray, radius: 5)
            
            HStack {
                Text("Hola \(currentUserName)")
                    .font(.title)
                    .foregroundColor(.black)
                
                Button(action: {
                    withAnimation {
                        cambiarNombre.toggle()
                    }
                }) {
                    Image(systemName: "keyboard")
                        .foregroundColor(.red)
                }
            }
            
            if cambiarNombre{
                HStack {
                    TextField("¿Cuál es tu nombre?", text: $currentUserName)                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .onAppear{
            currentUserName = userName ?? "desconocido/a"
        }
        .onDisappear {
            userName = currentUserName.isEmpty ? nil : currentUserName
        }
    }
}

#Preview {
    VistaIdentificacion()
}
