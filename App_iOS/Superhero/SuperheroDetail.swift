//
//  SuperheroDetail.swift
//  App_iOS
//
//  Created by Hyliard on 17/11/2024.
//

import SwiftUI
import SDWebImageSwiftUI
import Charts

struct SuperheroDetail: View {
    let id:String
    
    @State var superhero:ApiNetwork.SuperheroCompleted? = nil
    @State var loading:Bool = true
    var body: some View {
        VStack{
            if loading {
                ProgressView().tint(.white)
            }else if let superhero = superhero{
                WebImage(url: URL(string: superhero.image.url))
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                    .clipped()
                Text(superhero.name).bold().font(.title).foregroundColor(.white)
                ForEach(superhero.biography.aliases, id: \.self) { alias in
                    Text(alias).foregroundColor(.gray).italic()
                }
                SuperheroStats(stats: superhero.powerstats)
                
                Spacer()
            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("backgroundApp"))
            .onAppear{
                Task{
                    do{
                        superhero = try await ApiNetwork().getHeroById(id: id)
                    }catch{
                        superhero = nil
                    }
                    loading = false
                }
            }
    }
}

struct SuperheroStats: View {
    let stats: ApiNetwork.Powerstats
    
    var body: some View {
        VStack {
            // Crear una gráfica circular usando SectorMark
           Chart{
               //NO PUDE HACER ESTO POR QUE MI VERDION DE XCODE ES MAS VIEJA QUE LA ACTUAL.   
            //   BarMark(angle: .value("Count", Int(stats.combat) ?? 0),
            //                   innerRadius: .ratio(0.5),
            //                  angularInset: 2
            //  ).cornerRadius(5)
            //  BarMark(angle: .value("Count", Int(stats.durability) ?? 0),
            // innerRadius: .ratio(0.5),
            // angularInset: 2
            //)
        }
        .frame(width: 200, height: 200)
        .padding()
    }
        .frame(maxWidth: .infinity, maxHeight: 250)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 10)
        .padding(24)
}
}

struct SuperheroDetail_Previews: PreviewProvider {
    static var previews: some View {
        SuperheroDetail(id: "2")
    }
}
