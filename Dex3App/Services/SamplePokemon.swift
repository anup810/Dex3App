//
//  SamplePokemon.swift
//  Dex3App
//
//  Created by Anup Saud on 2024-08-12.
//

import Foundation
import CoreData

struct SamplePokemon {
    static let samplePokemon = {
        let context = PersistenceController.preview.container.viewContext
        //fetchrequest for sample data
        let fetchRequest: NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
        fetchRequest.fetchLimit = 1
        let results = try! context.fetch(fetchRequest)
        return results.first!
    }()
}
