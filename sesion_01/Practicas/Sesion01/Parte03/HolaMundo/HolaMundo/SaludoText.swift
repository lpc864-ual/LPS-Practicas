//
//  SaludoText.swift
//  HolaMundo
//
//  Created by Aula03 on 24/9/24.
//

import SwiftUI

struct SaludoText: View {
    private var msg:String;
   
    init(_ nombreUsuario:String){
        if nombreUsuario.isEmpty {
            msg = "Hola, ¿qué tal?"
        } else {
            msg = "Hola, \(nombreUsuario)"
        }
    }
    
    var body: some View {
        Text(msg)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color.blue)
            .padding()
    }
 
}
