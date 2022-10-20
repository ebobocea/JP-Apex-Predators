//
//  ContentView.swift
//  JP Apex Predators
//
//  Created by Elisei Bobocea on 06/03/2022.
//

import SwiftUI

struct ContentView: View {
    let apController = PredatorController()
    
    var body: some View {
        NavigationView {
            NavigationView {
                List {
                    ForEach(apController.apexPredators){ predator in
                        NavigationLink(destination: Text("Dino Details go here") ){
                            Text(predator.name)
                        }
                        
                    }
                }
                .navigationTitle("Apex Predators")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
