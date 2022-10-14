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
            HStack(spacing: 4) {
                ForEach(7 ..< notes.count) { note in
                    if(note == 9){
                        Button{}
                        label: {
                            Text("  ")
                                    .frame(maxWidth: .infinity)
                        }
                    }

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
                        .font(.system(size: 18))
                        .multilineTextAlignment(.center)
                        .foregroundColor(notes[note].isSelected ? Color("secondary") : Color("primary"))
                        .padding(.vertical)
                        .background(notes[note].isSelected ? Color("primary") : Color("secondary"))
                        .cornerRadius(12)
                    }
                }

            }
                    .padding(.horizontal, 20)
            Spacer().frame(height: 7)

            HStack(spacing: 4) {
                ForEach(0 ..< 7) { note in
                    Button {
                        playOscillator(note)
                    } label: {
                        Text(notes[note].name)
                                .bold()
                                .font(.system(size: 20, weight: .semibold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(notes[note].isSelected ? Color("secondary") : Color("primary"))
                                .frame(maxWidth: .infinity)
                                .padding(8)
                                .padding(.vertical, 18)
                                .background(notes[note].isSelected ? Color("primary") : Color("secondary"))
                                .cornerRadius(12)
                    }
                }
            }

        }.padding(.horizontal)
        .padding(.vertical, 5)
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
            if notes[note].isSelected {
                osc.stop()
                isOn = false
                notes[note].isSelected = false
            } else {
                osc.stop()
                isOn = false
                for num in 0 ..< notes.count {
                    notes[num].isSelected = false
                }
                playOscillator(note)
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
