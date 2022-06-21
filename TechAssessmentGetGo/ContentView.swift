//
//  ContentView.swift
//  TechAssessmentGetGo
//
//  Created by MacBook Pro on 21/06/22.
//

import SwiftUI
import URLImage

struct ContentView: View {
//    @ObservedObject var fetchData = FetchData()
    var body: some View {
        NavigationView {
            List { // fetchData.charList.results char in
                NavigationLink(destination: DetailView()) { //charList: char
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Hello")//char.name
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(10)
                        HStack {
                            Text("Species: Human") // + char.species
                                .font(.system(size: 18))
                                .padding(10)
                            Spacer()
                            Text("Status: Alive") // + char.status
                                .font(.system(size: 18))
                                .padding(10)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
            }
            
            .navigationBarHidden(true)
        }
    }
}

struct DetailView: View {
//    var charList: Character;
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                URLImage(URL (string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(maxHeight: UIScreen.main.bounds.height / 8)
                VStack {
                    Text("Hello")
                        .font(.system(size: 18))
                        .padding(10)
                }
                .background(Color.white)
                .cornerRadius(5.0)
                .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 2, alignment: .leading)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 10.0)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

