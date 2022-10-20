//
//  PredatorDetail.swift
//  JP Apex Predators
//
//  Created by Elisei Bobocea on 06/03/2022.
//

import SwiftUI

struct PredatorDetail: View {
    .let predator: ApexPredator
    
    var body: some View {
        ScrollView {
            VStack(alignment: .trailing){
                Image(predator.type)
                    .resizable()
                    .scaledToFit()
                Image(predator.name.lowercased().filter { $0 != " " })
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .shadow(color: .black, radius: 6, x: 0, y: 0)
                    .offset(y: -210)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                VStack(alignment: .leading){
                    Text(predator.name)
                        .font(.largeTitle)
                        .padding(.bottom, 8)
                    Text("Apears in: ")
                        .font(.title3)
                    ForEach(predator.movies, id: \.self) { movie in
                        Text("•" + movie)
                        font(.subheadline)
                    }
                    Text("Movie Moments")
                        .font(.title)
                        .padding(.top, 15)
                    ForEach(predator.movieScenes) { scene in
                        Text(scene.movie)
                            .font(.title2)
                            .padding([.top, .bottom], 1)
                        Text(scene.sceneDescription)
                            .padding(.bottom, 15)
                    }
                    Text("Read More:")
                        .font(.caption)
                    Link(predator.link, destination: URL(string: predator.link)!)
                        .font(.caption)
                        .foregroundColor(.blue)
                    }
                .padding(.top, -230)
                .padding()
                }
            }
        .edgesIgnoringSafeArea(.top)
    }
}

struct PredatorDetail_Preview: PreviewProvider {
    static var previews: some View {
        
        PredatorDetail(predator:  )
        .preferredColorScheme(.dark)
    }
}
