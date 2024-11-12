//
//  LabelExample.swift
//  App_iOS
//
//  Created by Hyliard on 12/11/2024.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        VStack {
            Label("yoga relax", image: "man")  // Usa una imagen personalizada llamada "man"
            Label("run mother f***er", systemImage: "figure.run")  // Ícono de SF Symbols

            Label(
                title: { Text("Label") },
                icon: {
                    Image("man")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                }
            )
        }
    }
}

struct LabelExample_Previews: PreviewProvider {
    static var previews: some View {
        LabelExample()
    }
}
