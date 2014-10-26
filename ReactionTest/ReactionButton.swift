//
//  ReactionButton.swift
//  ReactionTest
//
//  Created by Hesham Salman on 10/26/14.
//  Copyright (c) 2014 Hesham Salman. All rights reserved.
//

import Foundation
import UIKit


let NumberOfColors: UInt32 = 6

enum Color: Int, Printable {
    case Blue = 0, Green, Orange, Pink, Purple, Yellow
    
    var _Color: String {
        switch self {
        case .Blue:
            return "blue"
        case .Green:
            return "green"
        case .Orange:
            return "orange"
        case .Pink:
            return "pink"
        case .Purple:
            return "purple"
        case .Yellow:
            return "yellow"
        }
        
    }
    
    var description: String {
        return self._Color
    }
    
    static func random() -> Color {
        return Color(rawValue: Int(arc4random_uniform(NumberOfColors)))!
    }
    
}


class ReactionButton: UIButton {
    
}