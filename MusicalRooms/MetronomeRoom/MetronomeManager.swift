//
//  MetronomeManager.swift
//  MusicalRooms
//
//  Created by sap on 16/11/21.
//

import Foundation
import SwiftUI

class MetronomeManager{
    
    @Binding var bpm: Int
    @Binding var barNotes: Int
    @State var note:Int = 1
    @Binding var isOn: Bool
    @Binding var armAngle:Double
    var timer: Timer
    
    let signatures = ["1/4", "2/4", "3/4", "4/4", "5/4", "6/4", "3/8", "5/8", "6/8", "7/8", "9/8", "12/8"]
    
    
    
    func start(){
        isOn = true
        self.tick()
    }
    
    private func tick(){
        if(!isOn){return}
        if(note<barNotes){note+=1}
        if(note==barNotes){note = 1}
        
        print("Tick")
        
        let delay:Double = Double(60/bpm)
        timer = Timer.scheduledTimer(withTimeInterval: delay, repeats: false, block: {timer in
            self.tick()
        })
    }
    
    private func sound(){
        let isPulse = (barNotes != 1) && (note == 1)
        
        
    }
    
    
    
    
    public init(bpm: Binding<Int>, barNotes: Binding<Int>, isOn: Binding<Bool>, armAngle: Binding<Double>){
        self._bpm = bpm
        self._barNotes = barNotes
        self._isOn = isOn
        self._armAngle = armAngle
        self.note = 1
        
        self.timer = Timer(timeInterval: 0.1, repeats: false, block: {timer in
            print("Metronome initialised")
        })
    }
    
    
    
}
