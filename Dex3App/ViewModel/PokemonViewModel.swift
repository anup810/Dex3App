//
//  PokemonViewModel.swift
//  Dex3App
//
//  Created by Anup Saud on 2024-08-12.
//

import Foundation

@MainActor
class PokemonViewModel: ObservableObject {
    enum Status{
        case notStarted
        case fetching
        case success
        case failure(error: Error)
    }
    @Published private(set) var status = Status.notStarted
    
    private let controller : FetchController
    init(controller: FetchController){
        self.controller = controller
        
        Task{
            await getPokemon()
        }
    }
    private func getPokemon() async{
        status = .fetching
        do{
           var pokedex = try await controller.fetchAllPokemon()
            pokedex.sort{$0.id < $1.id}
            
            //add data to coredata
            for pokemon in pokedex {
                let newPokemon = Pokemon(context: PersistenceController.shared.container.viewContext)
                newPokemon.id = Int16(pokemon.id)
                newPokemon.name = pokemon.name
                newPokemon.types = pokemon.types
                newPokemon.hp = Int16(pokemon.hp)
                newPokemon.attack = Int16(pokemon.attack)
                newPokemon.defense = Int16(pokemon.defense)
                newPokemon.specialAttack = Int16(pokemon.specialAttack)
                newPokemon.specialDefense = Int16(pokemon.specialDefense)
                newPokemon.shiny = pokemon.shiny
                newPokemon.speed = Int16(pokemon.speed)
                newPokemon.sprite = pokemon.sprite
                newPokemon.favorite = false
                
                //save data
                try PersistenceController.shared.container.viewContext.save()
            }
            status = .success
        }catch{
            status = .failure(error: error)
        }
    }
}
