//
//  PredatorRow.swift
//  JP Apex Predators
//
//  Created by Elisei Bobocea on 06/03/2022.
//

import SwiftUI

struct PredatorRow: View {
    let predator: ApexPredator
    var body: some View {
        HStack{
            //Dinosar Image
            Image(predator.name.lowercased().filter { $0 != " " })
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .shadow(color: .white, radius: 1, x: 0, y: 0)
            VStack(alignment: .leading){
                //name
                Text(predator.name)
                    .fontWeight(.bold)
                //type
                Text(predator.type.capitalized)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.horizontal, 13)
                    .padding(.vertical, 5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(predator.typeOverlay().opacity(0.33))
                    )
                
            }
        }
    }
}
