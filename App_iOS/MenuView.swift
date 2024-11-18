//
//  MenuView.swift
//  App_iOS
//
//  Created by Hyliard on 12/11/2024.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Fondo oscuro para la vista principal
                Color.black.opacity(20)
                    .ignoresSafeArea()
                
                VStack {
                    // Título de la vista
                    Text("Main Menu")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 50)
                    
                    // Lista de opciones
                    List {
                        // Opción de IMC Calculator
                        NavigationLink(destination: IMCView()) {
                            Text("IMC Calculator")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue.opacity(0.7))
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }

                        // Opción de Superhero Finder
                        NavigationLink(destination: SuperheroSearcher()) {
                            Text("Superhero Finder")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.green.opacity(0.7))
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                    }
                    .listStyle(PlainListStyle())
                    .padding(.top, 20)
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
