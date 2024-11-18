//
//  SuperheroSearcher.swift
//  App_iOS
//
//  Created by Hyliard on 15/11/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperheroSearcher: View {
    @State var superheroName: String = ""
    @State var wrapper: ApiNetwork.Wrapper? = nil
    @State var loading:Bool = false
    var body: some View {
        VStack {
            // Campo de texto para la búsqueda del superhéroe
            TextField("", text: $superheroName, prompt: Text("Escribe tu superhéroe aquí..."))
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding(16)
                .background(Color(.blue).opacity(0.8)) // Fondo consistente
                .cornerRadius(8)
                .border(.blue, width: 1.5)
                .padding(8)
                .autocorrectionDisabled()
                .onSubmit {
                    loading = true
                    print(superheroName)
                    Task {
                        do {
                            wrapper  = try await ApiNetwork().getHeroesByQuery(query: superheroName)
                            print("response")
                            
                        } catch {
                            print("ERROR")
                        }
                        loading = false
                    }
                }
            if loading{
                ProgressView().tint(.white)
            }
            NavigationStack{
                // Lista de resultados de superhéroes
                List(wrapper?.results ?? []) { superhero in
                    ZStack{
                        SuperheroItem(superhero: superhero)
                        NavigationLink(destination: SuperheroDetail(id:superhero.id)){EmptyView()}.opacity(0)
                    }.listRowBackground(Color(.blue).opacity(20)) // Asegura que el fondo de cada celda sea consistente
                }.listStyle(.plain) // Estilo de lista
            }
            Spacer() // Espaciador para alinear correctamente
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color(.blue).opacity(20))
    }
}

struct SuperheroItem: View {
    let superhero: ApiNetwork.Superhero
    
    var body: some View {
        ZStack {
            Rectangle()
            
            WebImage(url: URL(string: superhero.image.url))
                .resizable()
                .indicator(.activity)
                .scaledToFill()
                .frame(height: 200)
            
            
            VStack {
                Spacer()
                Text(superhero.name)
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.5))
            }
        }
        .frame(height: 200)
        .cornerRadius(32)
    }
}

struct SuperheroSearcher_Previews: PreviewProvider {
    static var previews: some View {
        SuperheroSearcher()
    }
}
