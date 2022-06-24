//
//  ContentView.swift
//  TechAssessmentGetGo
//
//  Created by MacBook Pro on 21/06/22.
//

import SwiftUI

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
                        Alert(title: Text("Warning"), message: Text(fetchData.msg), dismissButton: .default(Text("OK")))
                    }
                    
                } else {
                    List(fetchData.charList.results) { char in
                        NavigationLink(destination: CharacterDetail(charDetail: char)) {
                            CharacterRow(char: char)
                            
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
            }
            
            .navigationBarTitle(Text("Character"))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

