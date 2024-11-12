//
//  MenuView.swift
//  App_iOS
//
//  Created by Hyliard on 12/11/2024.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack{
            List{
                NavigationLink(destination:IMCView()){
                    Text("IMC Calculator")
                }
                NavigationLink(destination:SuperheroSearcher()){
                    Text("Superhero finder")
                }
                Text("Hyliard 1")
                Text("Hyliard 2")
                Text("Hyliard 3")
                Text("Hyliard 4")
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("backgroundApp"))
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
