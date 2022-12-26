//
//  VideoListView.swift
//  Africa
//
//  Created by Selin Çağlar on 13.12.2022.
//

import SwiftUI

struct VideoListView: View {
//MARK: - PROPERTIES
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
//MARK: - BODY
    var body: some View {
        
        NavigationView {
            List {
                ForEach(videos) { item in
                    VideoListItemView(video: item)
                        .padding(.vertical, 8)
                }//:loop
            }//:list
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action:{
                        //:shuffle videos
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }){
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        }//:navigation
    }
}


//MARK: - PREVIEW
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
            .previewDevice("iPhone 11 Pro")
    }
}
