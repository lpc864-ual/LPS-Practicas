import Foundation

// Ejercicio 4: Diccionario de alumnos con arrays de notas
var diccionario:[String:[Int]] = [:]

// Añadiendo algunas entradas iniciales
diccionario["andres"] = [2, 4]
diccionario["antonio"] = [3, 5, 6, 7]
diccionario["juan"] = [1, 4, 3]

// Función para calcular la nota media
func notaMedia(notas: [Int]) -> String {
    let suma = notas.reduce(0, +)
    let media = Double(suma) / Double(notas.count)
    return String(format: "%.2f", media)
}

// Ordenar el diccionario por nota media en orden descendente
let ordenPorNotaMedia = diccionario.sorted {
    let media1 = Double($0.value.reduce(0, +)) / Double($0.value.count)
    let media2 = Double($1.value.reduce(0, +)) / Double($1.value.count)
    return media1 > media2
}

// Mostrar el diccionario ordenado por nota media
print("Diccionario ordenado por nota media (descendente):")
for par in ordenPorNotaMedia {
    let media = notaMedia(notas: par.value)
    print("\(par.key) --> \(media)")
}
