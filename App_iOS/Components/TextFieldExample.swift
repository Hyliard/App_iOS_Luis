//
//  TextFieldExample.swift
//  App_iOS
//
//  Created by Hyliard on 12/11/2024.
//

import SwiftUI

struct TextFieldExample: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            TextField("Escribe tu email", text: $email)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(16)
                .padding(.horizontal, 32)
                .onChange(of: email) { newValue in
                    print("El nuevo valor de email es \(newValue)")
                }

            SecureField("Escribe tu contraseña", text: $password)
                .keyboardType(.default)
                .padding(16)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(16)
                .padding(.horizontal, 32)
                .onChange(of: password) { newValue in
                    print("El nuevo valor de contraseña es \(newValue)")
                }
        }
        .padding()
    }
}

struct TextFieldExample_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldExample()
    }
}


