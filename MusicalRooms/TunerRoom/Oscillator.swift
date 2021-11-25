//
//  Oscillator.swift
//  MusicalRooms
//
//  Created by Isaac Lee Jing Zhi on 19/11/21.
//

import Foundation
import SwiftUI
import AudioKit

class OscillatorObject {
    
    var engine = AudioEngine()
    var osc = PlaygroundOscillator()
    
    init() {
        engine.output = osc
    }
    
    func start(frequency: Float = 440) {
        
        osc.frequency = frequency 
        osc.amplitude = 0.6
        
        try? engine.start()
        osc.start()
    }
    
    func stop() {
        engine.stop()
    }
}

