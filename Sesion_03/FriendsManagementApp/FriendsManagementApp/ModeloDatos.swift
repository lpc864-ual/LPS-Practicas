//
//  ModeloDatos.swift
//  FriendsManagementApp
//
//  Created by Aula03 on 8/10/24.
//

import Foundation

final class ModeloDatos: ObservableObject{
    @Published var arrAmigos: [Amigo] = [
        Amigo(nombre: "Lionel Messi", telefono: "655-555-555", email: "leomessi@gmail.com",
                           about: "Soy Lionel Messi", imagenID: "messi",
                           latitud: 36.8304668189410, longitud:  -2.4060252816326977,
                           favorito: true),
        Amigo(nombre: "Luis Suarez", telefono: "602-80-80-80", email: "lsuarez@gmail.com",
              about: "Soy el mejor amigo de Lionel Messi", imagenID: "suarez",
              latitud: 36.8389157611977, longitud: -2.40714076462062,
              favorito: true),
        Amigo(nombre: "Neymar Junior", telefono: "602-50-50-50", email: "neymar@gmail.com",
              about: "Soy el jugador de futbol mas vibrante", imagenID: "neymar",
              latitud: 36.85764033530464, longitud: -2.452192838957072,
              favorito: true),
        Amigo(nombre: "Cristiano Ronaldo", telefono: "602-42-81-82", email: "cr7@gmail.com",
              about: "Soy el mejor jugador de futbol del mundo", imagenID: "cr7",
              latitud: 36.83041530329687, longitud: -2.4059776820622836,
              favorito: false)
    ]
}
