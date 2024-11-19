//
//  VistaImagen.swift
//  FriendsManagementApp
//
//  Created by Aula03 on 1/10/24.
//

import SwiftUI

struct VistaImagen: View {
    @State private var shadowColor: Color = .red
    @State private var backgroundColor: Color = .clear
    @State private var borderWidth: CGFloat = 2
    
    var body: some View {
        Image("messi")
            .resizable()
            .frame(width: 150, height: 150)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth:2))
            .shadow(color: shadowColor, radius: 4)
            .background(backgroundColor)
            .offset(y:-200)
            .onTapGesture {
                shadowColor = randomColor()
                backgroundColor = randomColor()
                borderWidth = CGFloat.random(in: 1...5)
            }
    }
}

private func randomColor() -> Color {
    return Color(
        red: Double.random(in: 0...1),
        green: Double.random(in: 0...1),
        blue: Double.random(in: 0...1)
    )
}

#Preview {
    VistaImagen()
}
