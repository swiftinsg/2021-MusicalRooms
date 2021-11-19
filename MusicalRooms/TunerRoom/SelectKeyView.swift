//
//  SelectKeyView.swift
//  MusicalRooms
//
//  Created by Isaac Lee Jing Zhi on 18/11/21.
//

import SwiftUI

struct SelectKeyView: View {
    
    @Binding var notes: [Note]
    
    fileprivate func selectSelectedKey(_ note: Int) {
        for num in 0 ..< notes.count {
            notes[num].isSelected = false
        }
        notes[note].isSelected.toggle()
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(7 ..< notes.count) { note in
                    Button {
                        selectSelectedKey(note)
                    } label: {
                        VStack {
                            Text(conversion(notes[note].name))
                                .fontWeight(.semibold)
                            Text(getEnharmonic(conversion(notes[note].name)))
                                .fontWeight(.semibold)
                        }
                        .font(.system(size: 20, design: .rounded))
                        .multilineTextAlignment(.center)
                        .foregroundColor(!notes[note].isSelected ? Color("darkBrown") : Color("evenLighterBrown"))
                    }
                    .padding()
                    .frame(width:60, height: 100, alignment: .leading)
                    .background(!notes[note].isSelected ? Color("evenLighterBrown") : Color("darkBrown"))
                    .cornerRadius(20)
                }
            }
            
            Spacer()
                .frame(height: 50)
            
            VStack {
                HStack {
                    ForEach(0 ..< 3) { note in
                        Button {
                            selectSelectedKey(note)
                        } label: {
                            Text(notes[note].name)
                                .bold()
                                .font(.system(size: 20, design: .rounded))
                                .multilineTextAlignment(.center)
                                .foregroundColor(!notes[note].isSelected ? Color("darkBrown") : Color("evenLighterBrown"))
                        }
                        .padding()
                        .frame(width:50, height: 50, alignment: .leading)
                        .background(!notes[note].isSelected ? Color("evenLighterBrown") : Color("darkBrown"))
                        .cornerRadius(20)
                    }
                }
                HStack {
                    ForEach(3 ..< 7) { note in
                        Button {
                            selectSelectedKey(note)
                        } label: {
                            Text(notes[note].name)
                                .bold()
                                .font(.system(size: 20, design: .rounded))
                                .multilineTextAlignment(.center)
                                .foregroundColor(!notes[note].isSelected ? Color("darkBrown") : Color("evenLighterBrown"))
                        }
                        .padding()
                        .frame(width:50, height: 50, alignment: .leading)
                        .background(!notes[note].isSelected ? Color("evenLighterBrown") : Color("darkBrown"))
                        .cornerRadius(20)
                    }
                }
            }
            
            Spacer()
                .frame(height: 35)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 350, height: 120)
                .foregroundColor(Color("darkerBrown"))
                .overlay(
                    BottomButtonView(notes: $notes)
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
            Note(name: "Asharp", hertz: 466.16)]))
    }
}
