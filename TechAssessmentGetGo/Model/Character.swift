//
//  Character.swift
//  TechAssessmentGetGo
//
//  Created by MacBook Pro on 21/06/22.
//

import Foundation

struct Character: Decodable, Identifiable {
    public var id: Int
    public var name: String
    public var status: String
    public var species: String
    public var type: String
    public var gender: String
    public var origin: [String: String]
    public var location: [String: String]
    public var image: String
    public var episode: [String]
    public var url: String
    public var created: String
}
