//
//  ReadingQuestionView.swift
//  MusicalRooms
//
//  Created by sap on 24/11/21.
//

import SwiftUI

struct ReadingQuestionView: View {
    
    @State var clefs = ["Treble", "Alto", "Tenor", "Bass"]
    
    @Binding var clefIndex: Int //Treble, alto, tenor, bass
    @Binding var noteIndex: Int //Notes, then sharps. C,D,E,F,G,A,B,C#,D#,F#,G#
    @Binding var isRaised: Bool //Is sharped?
    
    @Binding var isTimed: Bool //If false then question-based
    
    @Binding var timedLength: Int //Length of timer
    @Binding var elapsedTime: Int //Time already run
    
    @Binding var questionAmt: Int //Amt of questions
    @Binding var questionNo: Int //Current question
    
    var body: some View {
        
        
        VStack{
            
            VStack(alignment: .leading){
                Text(isTimed ? "\(timedLength-elapsedTime)"  :  "\(questionNo)/\(questionAmt)")
                    .foregroundColor(Color("darkerBrown"))
                    .font(Font.system(size: 22, weight: .semibold, design: .rounded))
                    .offset(x: 5, y: -10)
                    .padding()
                
                //Stave & notes
                ZStack{
                    
                    //Lines
                    VStack{
                        ForEach(0 ..< 5){ _ in
                            Rectangle()
                                .frame(width: 200, height: 2, alignment: .center)
                                .foregroundColor(.black)
                                .cornerRadius(0.5)
                            Spacer().frame(height:17)
                        }
                    }
                    
                    HStack{
                        
                        //Clef
                        ClefView(clefIndex: $clefIndex) //refactored
                        
                        //Note
                        NoteView(noteIndex: $noteIndex, isRaised: $isRaised, clefIndex: $clefIndex)
                            .frame(width: 40)
                        
                        
                    }
                    
                    
                }
                .frame(width: 300, height: 130, alignment: .center)
                .padding()
                
                
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color("lightBrown"), location: 0.2),
                            .init(color: Color("evenLighterBrown"), location: 0.2)
                        ]), startPoint: .top, endPoint: .bottom
                    ))
                    .frame(height:240)
            )
            
            
        }
        .padding(.leading, 15)
        .padding(.trailing, 15)
        
    }
    //funcs
    
}


struct NoteView: View{
    @State var isEnharmonic = false
    @State var enharmonicNoteIndex = 0
    
    @Binding var noteIndex: Int
    @Binding var isRaised: Bool
    
    @Binding var clefIndex: Int
    let clefCOffset = [-6, 0, 2, -1]
    
    var body: some View{
        
        ZStack{
            
            Ellipse()
                .fill(.black)
                .frame(width: 22, height: 18, alignment: .center)
            
            
            
            // Ledger lines
            let noteOffsetIndex = enharmonicNoteIndex + clefCOffset[clefIndex]
            if(abs(noteOffsetIndex) > 5){
                let neededLines = getNeededLines(noteOffsetIndex: enharmonicNoteIndex)
                
                let lines = abs(neededLines)+1 //+1 for ..<
                ForEach(0 ..< lines){ line in
                    if((lines-line)%2 == 1){
                        Rectangle()
                            .cornerRadius(1)
                            .frame(width: 40, height: 2, alignment: .center)
                            .offset(y: -CGFloat(line)*9.5)
                    }
                }
                
            }
            
        }
        .offset(x: -15, y: CGFloat(-(enharmonicNoteIndex+clefCOffset[clefIndex]))*9.5-9)
        
        onChange(of: isRaised, perform: {raised in
            updateEnharmonic()
        })
        onAppear{
            updateEnharmonic()
        }
    }
    
    func getNeededLines(noteOffsetIndex: Int) -> Int{
        var neededLines = abs(noteOffsetIndex) - 6 //Amount of ledger lines needed, with +/- meaning up and down
        if(noteOffsetIndex < 0){
            neededLines = -neededLines
        }
        return neededLines
    }
    
    func updateEnharmonic(){
        if(isRaised){
            isEnharmonic = Bool.random()
            enharmonicNoteIndex = noteIndex + 1
        }else{
            enharmonicNoteIndex = noteIndex
        }
    }
}


//CLEF - different params for each clef
struct ClefView: View {
    let clefs = ["Treble", "Alto", "Tenor", "Bass"]
    @Binding var clefIndex: Int
    
    var body: some View {
        switch clefIndex{
        case 0:
            Image(clefs[clefIndex])
                    .resizable()
                    .frame(width: 58, height: 120, alignment: .center)
                    .padding(.trailing, 15)
                    .offset(x:-35, y:-3.5)
        case 1:
            Image(clefs[clefIndex])
                    .resizable()
                    .frame(width: 70, height: 88, alignment: .center)
                    .padding(.trailing, 15)
                    .offset(x:-35, y:-3.5)
        case 2:
            Image(clefs[clefIndex])
                    .resizable()
                    .frame(width: 70, height: 88, alignment: .center)
                    .padding(.trailing, 15)
                    .offset(x:-35, y:-3.5)
        case 3:
            Image(clefs[clefIndex])
                    .resizable()
                    .frame(width: 60, height: 78, alignment: .center)
                    .padding(.trailing, 15)
                    .offset(x:-35, y:-8)
        default: Text("Error: invalid clef index \(clefIndex)").foregroundColor(.red)
        }
        
        
    }
}




struct ReadingQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        SightreadingQuizView()
    }
}
