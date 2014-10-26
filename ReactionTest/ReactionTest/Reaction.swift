//
//  Reaction.swift
//  ReactionTest
//
//  Created by Hesham Salman on 10/26/14.
//  Copyright (c) 2014 Hesham Salman. All rights reserved.
//

import Foundation

let levelThreshhold = 1000

protocol ReactionDelegate {
    func gameDidBegin(reaction: Reaction)
    func gameDidEnd(reaction: Reaction)
    func gameColorDidSelect(reaction: Reaction)
    func gameColorDidChange(reaction: Reaction)
    func gameDidLevelUp(reaction: Reaction)
}

class Reaction{
    var delegate:ReactionDelegate
    let NumberOfColors: UInt32 = 7
    enum Color: Int, Printable {
        case Red = 0, Blue, Green, Yellow, Purple, Orange, Pink

        
        var description: String {
            switch self {
            case .Red:
                return "red"
            case .Blue:
                return "blue"
            case .Green:
                return "green"
            case .Yellow:
                return "yellow"
            case .Purple:
                return "purple"
            case .Orange:
                return "orange"
            case .Pink:
                return "pink"
            }
        }
        
        static func random() -> Color {
            return Color(rawValue: Int(arc4random_uniform(NumberOfColors)))!
        }
        
    }
    
    var score:Int
    var level:Int
    
    init() {
        
    }
    
    
}