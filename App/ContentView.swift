//
//  ContentView.swift
//  Africa
//
//  Created by Selin Çağlar on 13.12.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//MARK: - PROPERTIES
        
        let animals: [Animal] = Bundle.main.decode("animals.json")
        
//MARK: - BODY
        NavigationView{
            List{
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                ForEach(animals) { animal in
                    NavigationLink(destination: AnimalDetailView(animal: animal)){
                        AnimalListView(animal: animal)
                    }//:link
                }//:loop
            }//:list
            .navigationBarTitle("Africa", displayMode: .large)
        }//:navigation
    }
}


//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
