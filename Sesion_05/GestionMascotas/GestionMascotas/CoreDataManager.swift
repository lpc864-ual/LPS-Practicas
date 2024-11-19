//
//  CoreDataManager.swift
//  GestionMascotas
//
//  Created by Aula03 on 29/10/24.
//

import Foundation
import SwiftUI
import CoreData


class CoreDataManager {
    static let instance = CoreDataManager()
    let contenedor: NSPersistentContainer
    let contexto: NSManagedObjectContext
    
    init() {
        contenedor = NSPersistentContainer(name: "GestionMascotasModel")
        
        contenedor.loadPersistentStores { (descripcion, error) in
            if let error = error {
                print("Error al cargar datos de CoreData: \(error)")
            } else {
                print("Carga de datos correcta")
            }
        }
        
        contexto = contenedor.viewContext
    }
    
    func save() {
        do {
            try contexto.save()
            print("Datos almacenados correctamente")
        } catch let error {
            print("Error al guardar datos \(error)")
        }
    }
}
