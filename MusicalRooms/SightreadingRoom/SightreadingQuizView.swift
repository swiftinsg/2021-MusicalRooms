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
    
    @State var clefIndex = 0
    @State var noteIndex = -2 //Notes in ascending order by tones from C3 (center of piano)
    @State var isRaised = true //Note raised?
    
    @State var isTimed = false //If false then question-based
    @State var timedLength = 30 //Length of timer
    @State var elapsedTime = 0 //Time elapsed on timer
    @State var questionAmt = 10 //Amt of questions
    @State var questionNo = 0 //Current question
    
    
    
    
    
    var body: some View {
        VStack (alignment: .center, spacing: 40) {
            ReadingQuestionView(clefIndex: $clefIndex, noteIndex: $noteIndex, isRaised: $isRaised, isTimed: $isTimed, timedLength: $timedLength, elapsedTime: $elapsedTime, questionAmt: $questionAmt, questionNo: $questionNo)
            
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
