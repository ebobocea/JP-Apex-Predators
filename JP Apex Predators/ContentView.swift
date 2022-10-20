//
//  ContentView.swift
//  JP Apex Predators
//
//  Created by Elisei Bobocea on 06/03/2022.
//

import SwiftUI

struct ContentView: View {
    let apController = PredatorController()
    @State var sortAlphabectical = false
    
    var body: some View {
        
        if sortAlphabectical{
            apController.sortByAlphabetical()
        }else{
            apController.sortByMovieAppearance()
        }
        
        
        
        return NavigationView {
            NavigationView {
                List {
                    ForEach(apController.apexPredators){ predator in
                        NavigationLink(destination: PredatorDetail(predator: predator) ){
                            PredatorRow(predator: predator)
                        }
                        
                    }
                }
                .navigationTitle("Apex Predators")
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        Button{
                            sortAlphabectical.toggle()
                        } label: {
                            if sortAlphabectical {
                                Image(systemName: "film")
                                
                            }else{
                                Image(systemName: "textformat")
                                
                            }
                        }
                    }
                }
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
