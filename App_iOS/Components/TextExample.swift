//
//  TextExample.swift
//  App_iOS
//
//  Created by Hyliard on 12/11/2024.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        VStack{
            Text("Hola, Hyliard").font(.headline)
            Text("Custom").font(.system(
                size: 40, weight: .light, design:
                        .monospaced))
            .bold()
                .italic()
                .underline()
                .foregroundColor(.blue)
                .background(.red)
            Text("Luis Gerardo Martinez Hernandez")
                .frame(width: 150)
                .lineLimit(3)
                .lineSpacing(10)
        }
    }
}

struct TextExample_Previews: PreviewProvider {
    static var previews: some View {
        TextExample()
    }
}
