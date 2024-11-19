// Ejercicio 01
func funcionEjercicio01(valor: Int, accion1: (Int) -> String, accion2: (Int) -> String) {
    for i in 1...valor {
        print("Iteración \(i)", "Acción 1", accion1(i), separator: " -> ")
        print("Iteración \(i)", "Acción 2", accion2(i), separator: " -> ")
    }
}

// Llamada usando la notación clásica
funcionEjercicio01(valor: 3, accion1: { "Resultado de Acción 1: \($0 * 2)" }, accion2: { "Resultado de Acción 2: \($0 + 10)" })

// Llamada usando trailing closure
funcionEjercicio01(valor: 3) {"Resultado de Acción 1: \($0 * 2)"} accion2: {"Resultado de Acción 2: \($0 + 10)"}

// Ejercicio 02

func getMessage(lugar: String, accion: (Int, String) -> String) -> String {
    return accion(Int.random(in: 1...3), lugar)
}

var mensaje: String = getMessage(lugar: "Londres") {
    switch $0 {
    case 1:
        return "me voy de marcha a \($1)"
    case 2:
        return "me voy a trabajar a \($1)"
    case 3:
        return "me voy a estudiar a \($1)"
    default:
        return "me voy a \($1)"
    }
}

// Imprimimos el mensaje
print(mensaje)

