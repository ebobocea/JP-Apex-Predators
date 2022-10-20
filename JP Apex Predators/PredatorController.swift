//
//  PredatorController.swift
//  JP Apex Predators
//
//  Created by Elisei Bobocea on 06/03/2022.
//

import Foundation


class PredatorController {
    var apexPredators: [ApexPredator] = []
    
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
            } catch {
                print("Error decoding data \(error)")
            }
        }
    }
    
    func sortByAlphabetical(){
        apexPredators.sort(by: { $0.name < $1.name })
    }
    
    func sortByMovieAppearance(){
        apexPredators.sort(by: { $0.id < $1.id })
    }
}
