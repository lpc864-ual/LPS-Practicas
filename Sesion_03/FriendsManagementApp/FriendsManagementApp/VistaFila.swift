import SwiftUI

struct VistaFila: View {
    var amigoCurrent: Amigo
    var body: some View {
            HStack {
                Image(amigoCurrent.imagenID)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(color: Color.red, radius: 1)

                VStack(alignment: .leading) {
                    Text(amigoCurrent.nombre)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.green)
                    Text(amigoCurrent.telefono)
                        .font(.caption2)
                        .fontWeight(.medium)
                }
                
                Spacer()
                
                Image(systemName: amigoCurrent.favorito ? "star.fill" : "star")
                    .foregroundColor(amigoCurrent.favorito ? .yellow : .gray)
            }
            .background(Color.white)
    }
}

#Preview {
    ForEach(ModeloDatos().arrAmigos) { amigoCurrent in
        VistaFila(amigoCurrent: amigoCurrent)
    }
}
