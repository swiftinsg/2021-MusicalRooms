//
//  SelectKeyView.swift
//  MusicalRooms
//
//  Created by Isaac Lee Jing Zhi on 18/11/21.
//

import SwiftUI

struct SelectKeyView: View {
    
    @Binding var notes: [Note]
    @Binding var variance: Float
    
    fileprivate func selectSelectedKey(_ note: Int) {
        for num in 0 ..< notes.count {
            notes[num].isSelected = false
        }
        notes[note].isSelected.toggle()
    }
    
    var body: some View {
        VStack {
            
            Spacer().frame(height: 55)
            
            HStack {
                ForEach(7 ..< notes.count) { note in
                    
                    if Int(note) == 9{
                        Spacer().frame(width: 49)
                    }
                    
                    Button {
                        selectSelectedKey(note)
                    } label: {
                        VStack {
                            Text(conversion(notes[note].name))
                                .fontWeight(.semibold)
                            Text(getEnharmonic(conversion(notes[note].name)))
                                .fontWeight(.semibold)
                        }
                        .font(.system(size: 18, design: .rounded))
                        .multilineTextAlignment(.center)
                        .foregroundColor(!notes[note].isSelected ? Color("darkBrown") : Color("evenLighterBrown"))
                    }
                    .frame(width: 49, height: 70, alignment: .center    )
                    .background(!notes[note].isSelected ? Color("evenLighterBrown") : Color("darkBrown"))
                    .cornerRadius(12)
                }
            }
            
            Spacer()
                .frame(height: 10)
            
            HStack {
                ForEach(0 ..< 7) { note in
                    Button {
                        selectSelectedKey(note)
                    } label: {
                        Text(notes[note].name)
                            .bold()
                            .font(Font.system(size: 20, weight: .semibold, design: .rounded))
                            .multilineTextAlignment(.center)
                            .foregroundColor(!notes[note].isSelected ? Color("darkBrown") : Color("evenLighterBrown"))
                    }
                    .frame(width: 43, height: 70, alignment: .center)
                    .background(!notes[note].isSelected ? Color("evenLighterBrown") : Color("darkBrown"))
                    .cornerRadius(12)
                }
            }
            
            Spacer()
                .frame(height: 35)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 350, height: 120)
                .foregroundColor(Color("darkerBrown"))
                .overlay(
                    BottomButtonView(notes: $notes, variance: $variance)
                )
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
            Note(name: "Asharp", hertz: 466.16)]), variance: .constant(0))
    }
}
