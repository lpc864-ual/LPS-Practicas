//
//  VistaDatos.swift
//  FriendsManagementApp
//
//  Created by Aula03 on 1/10/24.
//

import SwiftUI

struct VistaDatos: View {
    var body: some View {
        VStack {
            Spacer().frame(height: 80)
            Text("Lionel Messi")
                .font(.title)
                .foregroundColor(.white)
            Label("655-555-555", systemImage: "iphone")
                .font(.body)
            Link(destination: URL(string: "mailto:leomessi@gmail.com")!, label: {
                Image(systemName: "livephoto")
                    .frame(width: 20, height: 20, alignment: .center)
                Text("leomessi@gmail.com")
            })
            Divider()
            Text("About Lionel Messi")
                .font(.title2)
            Text("Texto descriptivo de este amigo")
                .font(.footnote)
            Spacer()
        }.background(Color.green)
    }
}

#Preview {
    VistaDatos()
}
