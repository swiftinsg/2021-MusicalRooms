//
//  PitchDetection.swift
//  MusicalRooms
//
//  Created by Isaac Lee Jing Zhi on 19/11/21.
//

import Foundation
import Tuna

class PitchDetector {
    let pitchEngine = PitchEngine()
    
    init() {
        
    }
    
    func start() {
        pitchEngine.start()
    }
}
