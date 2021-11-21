//
//  SightreadingQuizView.swift
//  MusicalRooms
//
//  Created by Chelsea Ling on 16/11/21.
//

import SwiftUI

struct SightreadingQuizView: View {
    
    @State var CtoE = ["C", "D", "E"]
    @State var FtoB = ["F", "G", "A", "B"]
    @State var sharps = ["C#", "D#", "F#", "G#", "A#"]
    
    var body: some View {
        VStack (alignment: .center, spacing: 40) {
            RoundedRectangle(cornerRadius: 20)
                .frame(width:350, height: 250, alignment: .leading)
                .foregroundColor(Color("lightBrown"))
                .overlay(
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color("darkBrown"))
                            .frame(width: 350, height: 60, alignment: .leading)
                        
                        Text("1/10")
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                            .font(.system(.title, design: .rounded))
                            .lineLimit(3)
                            .foregroundColor(Color("evenLighterBrown"))
                            .frame(width: 350)
                            .offset(x: -120)
                    }
                        .offset(y: -94)
                )
            
            VStack {
                
                // C - E
                
                HStack {
                    ForEach(0 ..< CtoE.count) { note in
                        Button {
                            
                        } label: {
                            Text(CtoE[note])
                                .foregroundColor(Color("darkBrown"))
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .font(.system(size: 45, design: .rounded))
                        }
                        .padding()
                        .frame(width:70, height: 70, alignment: .leading)
                        .background( Color("evenLighterBrown"))
                        .cornerRadius(20)
                        
                    }
                }
                
                // F - B
                
                HStack {
                    ForEach(0 ..< FtoB.count) { note in
                        Button {
                            
                        } label: {
                            Text(FtoB[note])
                                .foregroundColor(Color("darkBrown"))
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .font(.system(size: 45, design: .rounded))
                        }
                        .padding()
                        .frame(width:70, height: 70, alignment: .leading)
                        .background( Color("evenLighterBrown"))
                        .cornerRadius(20)
                        
                    }
                }
            }
            
            VStack {
                HStack {
                    ForEach(0 ..< sharps.count) { note in
                        Button {
                            
                        } label: {
                            Text("\(sharps[note])\(getEnharmonic(sharps[note]))")
                                .foregroundColor(Color("darkBrown"))
                                .font(.system(size: 26.5, design: .rounded))
                                .multilineTextAlignment(.leading)
                        }
                        .padding()
                        .frame(width:68, height: 130, alignment: .leading)
                        .background( Color("evenLighterBrown"))
                        .cornerRadius(20)
                    }
                }
            }
        }
    }
}

struct SightreadingQuizView_Previews: PreviewProvider {
    static var previews: some View {
        SightreadingQuizView()
    }
}
