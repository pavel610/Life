//
//  LifeCell.swift
//  Life
//
//  Created by Павел Калинин on 01.08.2024.
//

import SwiftUI

struct LifeCell: View {
    var state: EntityState
    
    var body: some View {
        HStack {
            IconView(state: state)
            VStack(alignment: .leading) {
                Text(state.title) .font(.headline) .foregroundColor(.black)
                Text(state.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding()
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10) 
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}

#Preview {
    LifeCell(state: .aliveCell)
}
