//
//  ListExample.swift
//  App_iOS
//
//  Created by Hyliard on 15/11/2024.
//

import SwiftUI

var hyliards = [
    Hyliard(name: "Luis"),
    Hyliard(name: "Gerardo"),
    Hyliard(name: "Neyleth"),
    Hyliard(name: "Francisco"),
    Hyliard(name: "Gabriel")
]
var valorants = [
    valorant(name: "Sage"),
    valorant(name: "Viper"),
    valorant(name: "Reyna"),
    valorant(name: "Chamber"),
    valorant(name: "Kyo")
]
struct ListExample: View {
    var body: some View {
        
        // List{
        // ForEach(hyliards, id:\.name) { hyliard in
        //    Text(hyliard.name)
        //     }
        //  }
        // List(valorants){ valorant in
        // Text(valorant.name)
        //  }
        List{
            Section(header: Text("hyliards")) {
                ForEach(hyliards, id:\.name) { hyliard in
                    Text(hyliard.name)
                }
            }
            Section(header: Text("valorants")) {
                ForEach(valorants, id:\.name) { valorant in
                    Text(valorant.name)
                }
            }
        }.listStyle(.sidebar)
    }
    
}
struct Hyliard{
    let name:String
}

struct  valorant: Identifiable{
    var id = UUID()
    let name:String
}


struct ListExample_Previews: PreviewProvider {
    static var previews: some View {
        ListExample()
    }
}


