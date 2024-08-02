//
//  LifeViewModel.swift
//  Life
//
//  Created by Павел Калинин on 01.08.2024.
//

import Foundation

class LifeViewModel: ObservableObject {
    @Published var entities: [Entity] = []
    private var recentStates: [Entity] = []
    
    
    func create() {
        let newEntity = Bool.random() ? Entity(type: .aliveCell) : Entity(type: .deadCell)
        entities.append(newEntity)
        recentStates.append(newEntity)
        
        if recentStates.count > 3 {
            recentStates.removeFirst()
        }
        
        if recentStates.count == 3 {
            if recentStates.allSatisfy({ $0.type == .aliveCell }) {
                entities.append(Entity(type: .life))
                recentStates.removeAll()
            } else if recentStates.allSatisfy({ $0.type == .deadCell }) && !entities.filter({$0.type == .life}).isEmpty {
                entities.append(Entity(type: .death))
                recentStates.removeAll()
            }
        }
        
    }
}
