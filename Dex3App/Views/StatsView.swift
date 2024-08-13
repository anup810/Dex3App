//
//  StatsView.swift
//  Dex3App
//
//  Created by Anup Saud on 2024-08-13.
//

import SwiftUI
import Charts
struct StatsView: View {
    @EnvironmentObject var pokemon: Pokemon
    var body: some View {
        Chart(pokemon.stats){stat in
            //Bar chart
            BarMark(
                x:.value("Value", stat.value),
                y:.value("Stat", stat.label)
            ).annotation(position: .trailing) {
                Text("\(stat.value)")
                    .padding(.top,-5)
                    .foregroundStyle(.secondary)
                    .font(.subheadline)
            }
            
        }.frame(height: 200)
            .padding([.leading,.bottom,.trailing])
            .foregroundStyle(Color(pokemon.types![0].capitalized)) // color of bar depending upon the pokemon types
            .chartXScale(domain: 0...pokemon.highestStat.value + 5)
    }
}

#Preview {
    StatsView()
        .environmentObject(SamplePokemon.samplePokemon)
}
