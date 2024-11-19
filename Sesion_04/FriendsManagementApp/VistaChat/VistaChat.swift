//
//  VistaChat.swift
//  FriendsManagementApp
//
//  Created by Aula03 on 15/10/24.
//

import SwiftUI

func formatDate(date: Date) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    dateFormatter.timeStyle = .short
    dateFormatter.locale = Locale(identifier: "es")
    return dateFormatter.string(from: date)
}

struct VistaHeader: View {
    var titulo: String
    var icono: String
    
    var body: some View {
        HStack {
            Text(titulo)
                .font(.headline)
                .padding()
            Image(systemName: "plus")
                .foregroundColor(.black)
                .padding(5)
                .overlay(Circle().stroke(Color.black, lineWidth: 2)) // Borde negro
                .frame(width: 20, height: 40) // Tamaño del círculo
                       
            Image(systemName: "minus")
                .foregroundColor(.red)
                .padding(10)
                .overlay(Circle().stroke(Color.red, lineWidth: 2)) // Borde rojo
                .frame(width: 40, height: 40) // Tamaño del círculo
        }
    }
}

struct VistaChat: View {
    @EnvironmentObject var modeloDatos: ModeloDatos
    var body: some View {
        List(){
            ForEach(modeloDatos.arrAmigos){amigo in
                Section(
                    header: VistaHeader(titulo: amigo.nombre, icono: amigo.imagenID),
                    footer: Text("\(amigo.mensajes.count) mensaje\(amigo.mensajes.count == 1 ? "" : "s")")
                ) {
                    ForEach(amigo.mensajes, id: \.self){ mensajeStr in
                        HStack{
                            Image(systemName: mensajeStr.contestacion ? "arrow.right.to.line.circle" : "arrow.left.to.line.circle").foregroundColor(mensajeStr.contestacion ? Color.red : Color.green)
                            Text(mensajeStr.texto)
                            Spacer()
                            Text(formatDate(date: mensajeStr.date))
                                .font(.caption2)
                                .fontWeight(.thin)
                                .foregroundColor(Color.gray)
                                .padding([.top, .leading])
                        }
                    }
                }
            }
        }
    }
}
    
#Preview {
    VistaChat()
        .environmentObject(ModeloDatos())
}
