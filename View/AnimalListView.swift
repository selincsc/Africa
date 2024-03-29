//
//  AnimalListView.swift
//  Africa
//
//  Created by Selin Çağlar on 14.12.2022.
//

import SwiftUI

struct AnimalListView: View {
//MARK: - PROPERTIES
    let animal: Animal
    
//MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 16){
            Image(animal.image)
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            VStack(alignment: .leading, spacing: 8) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            }//:vstack
        }//:hstack
    }
}


//MARK: - PREVIEW
struct AnimalListView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    
    static var previews: some View {
        AnimalListView(animal: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
