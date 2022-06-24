//
//  FetchData.swift
//  TechAssessmentGetGo
//
//  Created by MacBook Pro on 21/06/22.
//

import Foundation

class FetchData: ObservableObject {
    @Published var charList = CharList(results: [])
    @Published var msg = ""
    var url_base = "https://rickandmortyapi.com/api/"
    
    init() {
        let url = URL(string: "\(url_base)character")!
                URLSession.shared.dataTask(with: url) {(data, response, error) in
                    do {
                        if let charData = data {
                            let decodedData = try JSONDecoder().decode(CharList.self, from: charData)
                            DispatchQueue.main.async {
                                self.charList = decodedData
                            }
                        } else {
                            self.msg = "No Data"
                        }
                    } catch {
                        self.msg = error.localizedDescription
                    }
                }.resume()
    }
}
