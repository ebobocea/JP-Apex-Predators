//
//  PredatorController.swift
//  JP Apex Predators
//
//  Created by Elisei Bobocea on 06/03/2022.
//

import Foundation


class PredatorController {
    private var apexPredators: [ApexPredator] = []
    var tempApexPredators: [ApexPredator] = []
    let typeFilters = ["All", "Land", "Air", "Sea"]
    
    init() {
        decodeApexPredatorData()
    }
    
    func decodeApexPredatorData(){
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexPredators = try decoder.decode([ApexPredator].self, from: data)
                tempApexPredators = apexPredators
            } catch {
                print("Error decoding data \(error)")
            }
        }
    }
    func typeIcon(for type: String) -> String{
        switch type{
        case "All": return "square.stack.3d.up.fill"
        case "Land": return "leaf.fill"
        case "Air": return "wind"
        case "Sea": return "drop.fill"
        default: return "questionmark"
        }
    }
    
    func filterby(type: String){
        switch type{
        case "Land", "Air", "Sea":
            tempApexPredators = apexPredators.filter
            {
                $0.type == type.lowercased()
            }
        default: tempApexPredators = apexPredators
        }
    }
    
    func sortByAlphabetical(){
        apexPredators.sort(by: { $0.name < $1.name })
    }
    
    func sortByMovieAppearance(){
        apexPredators.sort(by: { $0.id < $1.id })
    }
}
