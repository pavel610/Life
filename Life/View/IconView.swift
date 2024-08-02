//
//  IconView.swift
//  Life
//
//  Created by Павел Калинин on 01.08.2024.
//

import SwiftUI

struct IconView: View {
    var state: EntityState
    
    var body: some View {
        ZStack {
            LinearGradient(colors: state.gradientColors, startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 1))
                .clipShape(Circle())
                .frame(width: 50, height: 50)
            Text(state.emoji)
                .font(.callout)
        }
    }
}

#Preview {
    IconView(state: .deadCell)
}
