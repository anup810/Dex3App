//
//  Pokemon+Ext.swift
//  Dex3App
//
//  Created by Anup Saud on 2024-08-13.
//

import Foundation
extension Pokemon {
    //background image depends upon type
    var background:String {
        switch self.types![0]{
        case "normal","grass","electric","poison","fairy":
            return "normalgrasselectricpoisonfairy"
        case "rock","ground","steel","fighting","ghost","dark","psychic":
            return "rockgroundsteelfightingghostdarkpsychic"
        case "fire","dragon":
            return "firedragon"
        case "flying","bug":
            return "flyingbug"
        case "ice":
            return "ice"
        case "water":
            return "water"
        default:
            return "error"
            
        }
    }
    //arrange the stats labels
    var stats:[stat]{
        [
            stat(id: 1, label: "HP", value: self.hp),
            stat(id: 2, label: "Attack", value: self.attack),
            stat(id: 3, label: "Defense", value: self.defense),
            stat(id: 4, label: "Special Attack", value: self.specialAttack),
            stat(id: 5, label: "Special Defense", value: self.specialDefense),
            stat(id: 6, label: "Speed", value: self.speed)
 
        
        
        ]
    }
    // calculate the highest stat
    var highestStat: stat{
        stats.max{$0.value < $1.value}!
    }
    
    // swaping between two types, if the first type is normal
    func organizeTypes(){
        if self.types?.count == 2 && self.types![0] == "normal"{
//            let tempType = self.types![0]
//            self.types![0] = self.types![1]
//            self.types![1] = tempType
            self.types!.swapAt(0, 1)
            
        }
    }
}

struct stat: Identifiable{
    let id: Int
    let label: String
    let value: Int16
}
