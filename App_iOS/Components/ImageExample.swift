//
//  ImageExample.swift
//  App_iOS
//
//  Created by Hyliard on 12/11/2024.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        Image("man")
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
        
        Image(systemName: "figure.walk")
            .resizable()
            .frame(width: 50, height: 50)
    }
}

struct ImageExample_Previews: PreviewProvider {
    static var previews: some View {
        ImageExample()
    }
}
