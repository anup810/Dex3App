//
//  ContentView.swift
//  Dex3App
//
//  Created by Anup Saud on 2024-07-20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Pokemon.id, ascending: true)],
        animation: .default)
    private var pokedex: FetchedResults<Pokemon>
    
    var body: some View {
        NavigationStack {
            List(pokedex) { pokemon in
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
                }
            }.navigationTitle("PokeDex")
                .navigationDestination(for: Pokemon.self, destination: { pokemon in
                    PokemonDetailView()
                })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            
        }
    }
    
}
#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
