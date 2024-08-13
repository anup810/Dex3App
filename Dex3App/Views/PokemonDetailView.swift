//
//  DetailView.swift
//  Dex3App
//
//  Created by Anup Saud on 2024-08-12.
//

import SwiftUI
import CoreData

struct PokemonDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var pokemon: Pokemon
    @State var showShiny = false
    
    var body: some View {
        ScrollView{
            ZStack{
                Image(pokemon.background)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.8), radius: 6)
                AsyncImage(url: showShiny ? pokemon.shiny  : pokemon.sprite){image in
                    image
                        .resizable()
                        .scaledToFit()
                        .padding(.top,50)
                        .offset(y:70)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 6)
                    
                }placeholder: {
                    ProgressView()
                }
            }
            HStack{
                ForEach(pokemon.types!,id: \.self){ type in
                    Text(type.capitalized)
                        .font(.title2)
                        .shadow(color: .white,radius: 1)
                        .padding([.top,.bottom],7)
                        .padding([.leading, .trailing])
                        .background(Color(type.capitalized))
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                
                    
                }
                Spacer()
                Button {
                    withAnimation{
                        pokemon.favorite.toggle()
                        
                        do {
                            try viewContext.save()
                        } catch {
                  
                            let nsError = error as NSError
                            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                        }
                        
                    }
                }label: {
                    if pokemon.favorite{
                        Image(systemName: "star.fill")
                    }else {
                        Image(systemName: "star")
                    }
                }
                .font(.largeTitle)
                .foregroundStyle(.yellow)
            }.padding()
            Text("Stats")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(.bottom,-7)
            StatsView()
                .environmentObject(pokemon)
        }
        .navigationTitle(pokemon.name!.capitalized)
        .toolbar{
            ToolbarItem(placement: .topBarTrailing) {
                Button{
                    showShiny.toggle()
                }label: {
                    if showShiny{
                        Image(systemName: "wand.and.stars")
                            .foregroundStyle(.yellow)
                    }else{
                        Image(systemName: "wand.and.stars.inverse")
                    }
                }
            }
        }
    }
}

#Preview {

    PokemonDetailView()
        .environmentObject(SamplePokemon.samplePokemon)
}
