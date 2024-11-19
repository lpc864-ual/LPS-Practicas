//
//  AddMascotaView.swift
//  GestionMascotas
//
//  Created by Aula03 on 29/10/24.
//

import SwiftUI

struct AddMascotaView: View {
    @EnvironmentObject var vm: ViewModel
    @Binding var mostrarAddMascota: Bool
    var persona: PersonaEntity
    @State var nombre: String = ""
    @State var edad: Double = 0
    @State var tipoMascota: String = "Perro"
    
    var body: some View {
        VStack(spacing: 10) {
            TextField("Nombre de la mascota", text: $nombre)
                .font(.system(size: 20, weight: .bold))
                .textCase(.none)
                .textFieldStyle(PlainTextFieldStyle())
                .padding()
            
            
            HStack {
                Text("Edad: \(Int(edad))")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black)
                    .textCase(.none)
                Slider(value: $edad, in: 0...20, step: 1)
            }
            .padding(.horizontal)
            
            Picker("Tipo de Mascota", selection: $tipoMascota) {
                Text("Perro").tag("Perro")
                Text("Gato").tag("Gato")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            HStack(spacing: 50) {
                Button(action: {
                    mostrarAddMascota = false
                }) {
                    Image(systemName: "hand.thumbsdown")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.red)
                }
                
                
                Button(action: {
                    vm.addMascota(persona: persona, nombre: nombre, edad: Int16(edad), raza: tipoMascota)
                    mostrarAddMascota = false
                }) {
                    Image(systemName: "hand.thumbsup")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.blue)
                }
            }
            .padding(.vertical, 20)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 15).fill(Color(.systemGray6)).shadow(radius: 10))
        .padding()
    }
}
