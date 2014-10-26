//
//  Constants.swift
//  CrocJumpr
//
//  Created by Hesham Salman on 26/10/2014.
//  Copyright (c) 2014 Hesham Salman. All rights reserved.
//

import UIKit

//MARK: constants

let BackgroundImage = "Background"
let GroundImage = "Ground"
let WaterImage = "Water"
let CrocMouthClosedImage = "CrocMouthClosed"
let CrocMouthOpenImage = "CrocMouthOpen"
let CrocMaskImage = "CrocMask"

let BackgroundMusicSound = "CheeZeeJungle.caf"
let SliceSound = "Slice.caf"
let SplashSound = "Splash.caf"
let NomNomSound = "NomNom.caf"


struct Layer {
    static let Background: CGFloat = 0
    static let Crocodile: CGFloat = 1
    static let Player: CGFloat = 2
    static let Foreground: CGFloat = 3
}

struct Category {
    static let Crocodile: UInt32 = 1
    static let Player: UInt32 = 8
}


//MARK: game configuration

