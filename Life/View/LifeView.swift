//
//  ContentView.swift
//  Life
//
//  Created by Павел Калинин on 01.08.2024.
//

import SwiftUI

struct LifeView: View {
    @StateObject private var viewModel = LifeViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.bgPurple, .black], startPoint: UnitPoint(x: 0.5, y: 0.0), endPoint: UnitPoint(x: 0.5, y: 1))
                .ignoresSafeArea()
            
            VStack {
                Text("Клеточное наполнение")
                    .foregroundStyle(.white)
                    .font(.title)
                    .bold()
                    .padding()
                
                ScrollViewReader { proxy in
                    ScrollView {
                        VStack {
                            ForEach (viewModel.entities) { entity in
                                LifeCell(state: entity.type)
                            }
                        }
                    }
                    .onChange(of: viewModel.entities) {_ in
                        guard let lastEntity = viewModel.entities.last else { return }
                        withAnimation {
                            proxy.scrollTo(lastEntity.id, anchor: .bottom)
                        }
                    }
                }
                
                Spacer()
                
                Button{
                    viewModel.create()
                } label: {
                    Text("Сотворить")
                        .foregroundStyle(.white)
                        .font(.callout)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.appPurple)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding()
                }
            }
        }
    }
}

#Preview {
    LifeView()
}
