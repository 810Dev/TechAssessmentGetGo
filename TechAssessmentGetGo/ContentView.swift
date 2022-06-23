//
//  ContentView.swift
//  TechAssessmentGetGo
//
//  Created by MacBook Pro on 21/06/22.
//

import SwiftUI
import URLImage

struct ContentView: View {
    @ObservedObject var fetchData = FetchData()
    @State var alert = true
    var body: some View {
        NavigationView {
            VStack {
                if (fetchData.msg != "") {
                    VStack(alignment: .center) {
                        Text(fetchData.msg)
                            .padding()
                    }
                    .alert(isPresented: $alert) {
                        Alert(title: Text("Test"), message: Text("TEST@"), dismissButton: .default(Text("OK")))
                    }
                    
                } else {
                    List(fetchData.charList.results) { char in
                        NavigationLink(destination: DetailView(charDetail: char)) {                            VStack(alignment: .leading, spacing: 2) {
                                Text(char.name)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .padding(10)
                                HStack {
                                    Text("Species: " + char.species)
                                        .font(.system(size: 18))
                                        .padding(10)
                                    Spacer()
                                    Text("Status: " + char.status)
                                        .font(.system(size: 18))
                                        .padding(10)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
            }
            
            .navigationBarTitle(Text("Character"))
        }
    }
}

struct DetailView: View {
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
                    List() {
                        ForEach(charDetail.episode, id: \.self) { episode in
                            Text(episode)
                                .font(.system(size: 18))
                                .padding([.top, .bottom, .trailing], 10)
                        }
                        
                        .listRowBackground(Color(red: 245/255, green: 241/255, blue: 230/255, opacity: 1))
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

