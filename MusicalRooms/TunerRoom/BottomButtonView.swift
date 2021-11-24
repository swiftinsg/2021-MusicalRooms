//
//  BottomButtonView.swift
//  MusicalRooms
//
//  Created by Isaac Lee Jing Zhi on 18/11/21.
//

import SwiftUI
import AudioKit

struct BottomButtonView: View {
    
    @Binding var notes: [Note]
    @Binding var variance: Float
    @State var isOn = false
    @State var noteFrequency: Float = 440
    
    var osc = OscillatorObject()
    
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "tuningfork")
                    .font(Font.title)
                    .frame(width: 80, height: 80, alignment: .center)
                    .foregroundColor(Color("darkBrown"))
                    .background(Color("evenLighterBrown"))
                    .cornerRadius(20)
                    .offset(x: -40)
            }
            
            Button {
               playOscillator()
            } label: {
                Image(systemName: "speaker.wave.3")
                    .font(Font.title)
                    .frame(width: 80, height: 80, alignment: .center)
                    .foregroundColor(Color("darkBrown"))
                    .background(Color("evenLighterBrown"))
                    .cornerRadius(20)
                    .offset(x: 40)
            }
        }
        .frame(width: 350, height: 120, alignment: .center)
    }
    func playOscillator() {
        isOn.toggle()
        for note in notes {
            if note.isSelected {
                noteFrequency = note.hertz
            }
        }
        
        if isOn {
            osc.stop()
        } else {
            osc.start(frequency: noteFrequency, variance)
        }
    }
}

struct BottomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BottomButtonView(notes: .constant([
            Note(name: "C", hertz: 261.63)]), variance: .constant(0))
    }
}
