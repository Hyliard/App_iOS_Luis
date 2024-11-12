//
//  ApiNetwork.swift
//  App_iOS
//
//  Created by Hyliard on 15/11/2024.
//

import Foundation

class ApiNetwork{
    
    struct Wrapper:Codable{
        let response:String
        let results:[Superhero]
    }
    
    struct Superhero:Codable, Identifiable{
        let id:String
        let name:String
        let image:ImageSuperhero
    }
    
    struct ImageSuperhero:Codable{
        let url:String
    }
    
    struct SuperheroCompleted:Codable{
        let id:String
        let name:String
        let image:ImageSuperhero
        let powerstats:Powerstats
        let biography:Biography
        let work:Work
    }
    struct Powerstats:Codable{
        let intelligence:String
        let strength:String
        let speed:String
        let durability:String
        let power:String
        let combat:String
    }
    struct Biography: Codable {
        let fullName: String
        let aliases: [String]
        let publisher: String
        let alignment: String
        
        enum CodingKeys: String, CodingKey {
            case fullName = "full-name"    // Se mapea fullName a "full-name" en el JSON
            case aliases
            case publisher
            case alignment
        }
    }
    struct Work:Codable{
        let occupation:String
        let base:String
    }
    
    func getHeroesByQuery(query:String) async throws -> Wrapper{
        let url = URL(string: "https://superheroapi.com/api/bbed112799984597ce000c3bf65f68b7/search/\(query)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // Decodificar la respuesta en el tipo Wrapper
        //let decoder = JSONDecoder()
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        // Devolver el resultado decodificado
        return wrapper
    }
    func getHeroById(id:String) async throws ->SuperheroCompleted{
        let url = URL(string: "https://superheroapi.com/api/bbed112799984597ce000c3bf65f68b7/\(id)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode(SuperheroCompleted.self, from: data)
    }
        
}
