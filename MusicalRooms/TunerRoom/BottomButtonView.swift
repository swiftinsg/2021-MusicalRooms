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
}

struct BottomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BottomButtonView(notes: .constant([
            Note(name: "C", hertz: 261.63),
            Note(name: "D", hertz: 293.66),
            Note(name: "E", hertz: 329.63),
            Note(name: "F", hertz: 349.23),
            Note(name: "G", hertz: 392.00),
            Note(name: "A", hertz: 440.00),
            Note(name: "B", hertz: 466.16),
            Note(name: "Csharp", hertz: 277.18),
            Note(name: "Dsharp", hertz: 311.13),
            Note(name: "Fsharp", hertz: 369.99),
            Note(name: "Gsharp", hertz: 415.30),
            Note(name: "Asharp", hertz: 466.16)]), variance: .constant(0))
    }
}
