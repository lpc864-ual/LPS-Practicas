//
//  VistaDatos.swift
//  FriendsManagementApp
//
//  Created by Aula03 on 1/10/24.
//

import SwiftUI

struct VistaDatos: View {
    @EnvironmentObject private var modeloDatos: ModeloDatos
    @State var textoOpinion: String = ""
    var dato: Amigo
    private let maxCaracteres = 150
    var index: Int{
        modeloDatos.arrAmigos.firstIndex(where: {$0.id == dato.id})!
    }
    var body: some View {
        ScrollView {
            Spacer().frame(height: 80)
            
            HStack{
                Text(dato.nombre)
                    .font(.title)
                    .foregroundColor(.white)
                Button{
                    modeloDatos.arrAmigos[index].favorito.toggle()
                }label: {
                    Image(systemName: dato.favorito ? "star.fill" : "star")
                        .foregroundColor(dato.favorito ? .yellow : .gray)
                }
            }
            
            Label(dato.telefono, systemImage: "iphone")
                .font(.body)
            Link(destination: URL(string: "mailto:\(dato.email)")!, label: {
                Image(systemName: "livephoto")
                    .frame(width: 20, height: 20, alignment: .center)
                Text(dato.email)
            })
            Divider()
            Text("About \(dato.nombre)")
                .font(.title2)
            Text("Texto descriptivo de este amigo")
                .font(.footnote)
            TextEditor(text: $textoOpinion)
                .onAppear {
                    textoOpinion = dato.about
                }
                .onDisappear {
                    modeloDatos.arrAmigos[index].about = textoOpinion
                }
                .frame(width: 350, height: 100)
                .scrollContentBackground(.hidden)
                .overlay(Rectangle().stroke(Color.gray, lineWidth: 2))
                .disableAutocorrection(true)
                .onChange(of: textoOpinion) { newValue in
                    // Limitar el texto a 150 caracteres
                    if newValue.count > maxCaracteres {
                        textoOpinion = String(newValue.prefix(maxCaracteres))
                    }
                }
            ProgressView(value: Double(textoOpinion.count), total: Double(maxCaracteres)) {
                Text("Número de caracteres: \(textoOpinion.count)/\(maxCaracteres)")
                    .foregroundColor(textoOpinion.count >= 100 ? .red : .black)
            }
            .frame(width: 350, alignment: .center)
            
                        
                
            Spacer()
        }.background(Color.green).ignoresSafeArea()
            .navigationTitle(dato.nombre)
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    var dato: Amigo =  Amigo(nombre: "Lionel Messi", telefono: "655-555-555", email: "leomessi@gmail.com",
                       about: "Soy Lionel Messi", imagenID: "messi",
                       latitud: 36.8304668189410, longitud:  -2.4060252816326977,
                       favorito: true)
    
    VistaDatos(dato: dato)
}
