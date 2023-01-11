//
//  GalleryView.swift
//  Africa
//
//  Created by Selin Çağlar on 13.12.2022.
//

import SwiftUI

struct GalleryView: View {
//MARK: - PROPERTIES
    @State private var selectedAnimal: String = "lion"
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    //SIMPLE GRID DEFINITION
    //let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    //EFFICIENT GRID DEFINITION
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    //DYNAMIC GRID LAYOUT
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
//MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            //MARK: - ımage
            Image (selectedAnimal)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 8 ))
            //MARK: - slider
            Slider(value: $gridColumn, in: 2...4, step: 1)
                .padding(.horizontal)
                .onChange(of: gridColumn, perform: { value in
                    gridSwitch()
                })
            
            //MARK: - grıd
            VStack (alignment: .center, spacing: 30){
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10){
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                        
                    }//:loop
                }//:grid
                .animation(.easeIn)
                .onAppear(perform:{
                    gridSwitch()
                })
            }//:vstack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }//:scroll
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}


//MARK: - PREVIEW
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
