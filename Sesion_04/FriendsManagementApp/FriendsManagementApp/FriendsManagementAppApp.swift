//
//  FriendsManagementAppApp.swift
//  FriendsManagementApp
//
//  Created by Aula03 on 1/10/24.
//

import SwiftUI

@main
struct FriendsManagementAppApp: App {
    @StateObject private var modeloDatos = ModeloDatos()
    var body: some Scene {
        WindowGroup {
            VistaMain()
                .environmentObject(modeloDatos)
        }
    }
}
