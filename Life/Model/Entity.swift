import SwiftUI

struct Entity: Identifiable, Equatable {
    let id = UUID()
    let type: EntityState
}

enum EntityState {
    case aliveCell, deadCell, life, death
    
    var title: String {
        switch self {
        case .aliveCell:
            return "Живая"
        case .deadCell:
            return "Мёртвая"
        case .life:
            return "Жизнь"
        case .death:
            return "Смерть"
        }
    }
    
    var subtitle: String {
        switch self {
        case .aliveCell:
            return "и шевелится!"
        case .deadCell:
            return "или прикидывается"
        case .life:
            return "Ку-ку"
        case .death:
            return "Смерть"
        }
    }
    
    var emoji: String {
            switch self {
            case .aliveCell:
                return "💥"
            case .deadCell:
                return "💀"
            case .life:
                return "🐣"
            case .death:
                return "☠️"
            }
        }
        
        var gradientColors: [Color] {
            switch self {
            case .aliveCell:
                return [Color.orange, Color.iconYellow]
            case .deadCell:
                return [Color.green, Color.iconGreen]
            case .life:
                return [Color.purple, Color.iconPink]
            case .death:
                return [Color.gray, Color.white]
            }
        }

}
