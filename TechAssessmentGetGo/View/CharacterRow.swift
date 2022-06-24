//
//  CharacterList.swift
//  TechAssessmentGetGo
//
//  Created by MacBook Pro on 24/06/22.
//

import SwiftUI

struct CharacterRow: View {
    var char: Character;
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
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
    }
}
