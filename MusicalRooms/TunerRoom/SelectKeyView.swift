//
//  SelectKeyView.swift
//  MusicalRooms
//
//  Created by Isaac Lee Jing Zhi on 18/11/21.
//

import SwiftUI

struct SelectKeyView: View {
    
    @Binding var notes: [Note]
    @State var noteFrequency = 440.0
    @State var isOn = false
    
    let osc = OscillatorObject()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 8) {
                ForEach(7 ..< notes.count) { note in
                    Button {
                        playOscillator(note)
                    } label: {
                        VStack {
                            Text(conversion(notes[note].name))
                                .fontWeight(.semibold)
                            Text(getEnharmonic(conversion(notes[note].name)))
                                .fontWeight(.semibold)
                        }
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 18, design: .rounded))
                        .multilineTextAlignment(.center)
                        .foregroundColor(notes[note].isSelected ? Color("lightBrown") : Color("darkBrown"))
                        .padding(.vertical)
                        .background(notes[note].isSelected ? Color("darkBrown") : Color("evenLighterBrown"))
                        .cornerRadius(12)
                    }
                }
            }
            Spacer()
                .frame(height: 10)
            
            HStack(spacing: 8) {
                ForEach(0 ..< 7) { note in
                    Button {
                        playOscillator(note)
                    } label: {
                        Text(notes[note].name)
                            .bold()
                            .font(Font.system(size: 20, weight: .semibold, design: .rounded))
                            .multilineTextAlignment(.center)
                            .foregroundColor(notes[note].isSelected ? Color("evenLighterBrown") : Color("darkBrown"))
                            .frame(maxWidth: .infinity)
                            .padding(8)
                            .background(notes[note].isSelected ? Color("darkBrown") : Color("evenLighterBrown"))
                            .cornerRadius(12)
                    }
                }
            }
            Spacer()
                
        }
        .padding(.horizontal)
    }
    func playOscillator(_ note: Int) {
        if !isOn {
            for num in 0 ..< notes.count {
                notes[num].isSelected = false
            }
            notes[note].isSelected.toggle()
            osc.start(frequency: notes[note].hertz)
            isOn = true
        } else {
            osc.stop()
            isOn = false
            for num in 0 ..< notes.count {
                notes[num].isSelected = false
            }
        }
    }
}

struct SelectKeyView_Previews: PreviewProvider {
    static var previews: some View {
        SelectKeyView(notes: .constant([
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
            Note(name: "Asharp", hertz: 466.16)]))
    }
}

