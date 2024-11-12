//
//  ButtonExample.swift
//  App_iOS
//
//  Created by Hyliard on 12/11/2024.
//

import SwiftUI

// Vista para el ejemplo de botones
struct ButtonExample: View {
    var body: some View {
        VStack(spacing: 20) {
            // Primer botón con mensaje en consola
            Button("Hola") {
                print("que más, todo fino")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(15)
            
            // Segundo botón con estilo personalizado
            Button(action: {
                print("que más, todo fino")
            }) {
                Text("Hyliard")
                    .frame(width: 100, height: 50)
            }
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(25)
        }
        .padding()
    }
}

// Vista para el contador de suscriptores
struct Counter: View {
    @State private var subscribersNumber = 0

    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                subscribersNumber += 1
            }) {
                Text("Suscriptores: \(subscribersNumber)")
                    .bold()
                    .font(.title)
                    .frame(height: 50)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

// Vista principal que contiene ambas sub-vistas
struct CombinedView: View {
    var body: some View {
        VStack(spacing: 40) {
            ButtonExample() // Llama a la vista de los botones
            Counter()       // Llama a la vista del contador
        }
        .padding()
    }
}

// Vista de previsualización de la vista combinada
struct CombinedView_Previews: PreviewProvider {
    static var previews: some View {
        CombinedView()
    }
}

