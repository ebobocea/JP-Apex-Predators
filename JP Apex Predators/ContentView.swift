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
    @State var currentFilter = "All"
    
    var body: some View {
        apController.filterby(type: currentFilter)
        
        if sortAlphabectical{
            apController.sortByAlphabetical()
        }else{
            apController.sortByMovieAppearance()
        }
        
        
        
        return NavigationView {
            NavigationView {
                List {
                    ForEach(apController.tempApexPredators){ predator in
                        NavigationLink(destination: PredatorDetail(predator: predator) ){
                            PredatorRow(predator: predator)
                        }
                        
                    }
                }
                .navigationTitle("Apex Predators")
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        Button{
                            withAnimation{
                                sortAlphabectical.toggle()
                            }
                        } label: {
                            if sortAlphabectical {
                                Image(systemName: "film")
                                
                            }else{
                                Image(systemName: "textformat")
                                
                            }
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing){
                        Menu{
                            Picker("filter", selection: $currentFilter.animation()){
                                ForEach(apController.typeFilters, id: \.self){ type in
                                    HStack{
                                        Text(type)
                                        Spacer()
                                        Image(systemName: apController.typeIcon(for: type))
                                    }
                                    
                                }
                            }
                        }label: {
                            Image(systemName: "slider.horizontal.3")
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
