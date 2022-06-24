//
//  CharacterDetail.swift
//  TechAssessmentGetGo
//
//  Created by MacBook Pro on 24/06/22.
//

import SwiftUI
import URLImage

struct CharacterDetail: View {
    var charDetail: Character;
    var body: some View {
        VStack(spacing: 0) {
            URLImage(URL (string: charDetail.image)!) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(maxHeight: UIScreen.main.bounds.height / 3)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Gender: " + charDetail.gender)
                    .font(.system(size: 18))
                    .padding(20)
                Text("Location: " + charDetail.location["name"]!)
                    .font(.system(size: 18))
                    .padding(20)
                Text("Origin: " + charDetail.origin["name"]!)
                    .font(.system(size: 18))
                    .padding(20)
                HStack(alignment: .top) {
                    Text("Episode: ")
                        .font(.system(size: 18))
                        .padding(20)
                    ScrollView {
                        LazyVStack {
                            ForEach(charDetail.episode.indices) { i in
                                Link(destination: URL(string: "\(charDetail.episode[i])")!) {
                                    Text("Episode \((i + 1))")
                                        .padding(10)
                                }
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color(red: 245/255, green: 241/255, blue: 230/255, opacity: 1))
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle(Text(charDetail.name), displayMode: .inline)
        }
    }
}
