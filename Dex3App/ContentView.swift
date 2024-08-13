//
//  ContentView.swift
//  Dex3App
//
//  Created by Anup Saud on 2024-07-20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Pokemon.id, ascending: true)],
        animation: .default) private var pokedex: FetchedResults<Pokemon>
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Pokemon.id, ascending: true)],
        predicate: NSPredicate(format: "favorite = %d",true),
        animation: .default
    )private var favorite: FetchedResults<Pokemon>
    
    
    @State var filtredByFavorites = false
    @StateObject private var pokemonVM = PokemonViewModel(controller: FetchController())
    
    var body: some View {
        switch pokemonVM.status {
        case .success:
            NavigationStack {
                List(filtredByFavorites ? favorite :pokedex) { pokemon in
                    NavigationLink(value:pokemon) {
                        AsyncImage(url: pokemon.sprite){ image in
                            image
                                .resizable()
                                .scaledToFit()
                        }placeholder: {
                            ProgressView()
                        }
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                        Text(pokemon.name!.capitalized)
                        
                        if pokemon.favorite {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                        }
                    }
                }.navigationTitle("PokeDex")
                    .navigationDestination(for: Pokemon.self, destination: { pokemon in
                        PokemonDetailView()
                            .environmentObject(pokemon)
                    })
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button{
                                withAnimation{
                                    filtredByFavorites.toggle()
                                }
                                
                            }label: {
                                Label("Filter By Favorites" ,systemImage: filtredByFavorites ? "star.fill" : "star")
                            }
                           
                            
                        }
                    }
                
            }
        default:
            ProgressView()
            
        }
    }
    
}
#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
