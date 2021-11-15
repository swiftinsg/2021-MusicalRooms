//
//  MetronomeHomeView.swift
//  MusicalRooms
//
//  Created by sap on 15/11/21.
//

import SwiftUI
import AVFAudio

struct MetronomeHomeView: View {
    
    var lightBrown:Color = Color(red: 131/255, green: 78/255, blue: 44/255, opacity: 1.0)
    var darkBrown:Color = Color(red: 70/255, green: 27/255, blue: 0, opacity: 1.0)
    var backBrown:Color = Color(red: 211/255, green: 165/255, blue: 109/255)
    
    @State var bpm: Int = 60
    @State var barNotes: Int = 1
    @State var isOn:Bool = false
    
    var body: some View {
    
        VStack{
            
            Text("Metronome")
                .font(.title.bold())
                .frame( alignment: .leading)
                .offset(x:-65)
                .padding()
            
            Spacer().frame(height: 30)
            
            
            // Arm
            ZStack{
                Rectangle()
                    .foregroundColor(lightBrown)
                    .frame(width: 7, height: 300, alignment: .center)
                Circle()
                    .foregroundColor(lightBrown)
                    .frame(width: 20, height: 20, alignment: .center)
            }
            
            Spacer().frame(height:20)
            
            
            // Tempo name
            Text(tempoName(bpm: bpm))
                .font(.title3.bold())
                .foregroundColor(lightBrown)
            
            Spacer().frame(height:30)
            
            
            // BPM modifier
            ZStack{
                Rectangle()
                    .foregroundColor(backBrown)
                    .frame(width: 250, height: 55, alignment: .center)
                    .cornerRadius(10)
                
                HStack{
                    Button("\(Image(systemName: "minus"))"){
                        print("Minus bpm")
                    }
                    .font(.title2.bold())
                    .foregroundColor(darkBrown)
                    
                    Spacer().frame(width: 55)
                    
                    Text("\(bpm)")
                        .font(.title.bold())
                        .foregroundColor(darkBrown)
                    
                    Spacer().frame(width: 55)
                    
                    Button("\(Image(systemName: "plus"))"){
                        print("Plus bpm")
                    }
                    .font(.title2.bold())
                    .foregroundColor(darkBrown)
                    
                }
            }
            
            Spacer().frame(height: 40)
            
            HStack{
                
                //Play
                ZStack{
                    Rectangle()
                        .foregroundColor(Color(red: 205/255, green: 150/255, blue: 100/255))
                        .frame(width: 165, height: 55, alignment: .center)
                        .cornerRadius(10)
                    Button(isOn ? "\(Image(systemName: "pause.fill"))" : "\(Image(systemName: "play.fill"))"){
                        isOn = !isOn
                        print("Start metronome")
                    }
                    .frame(width: 155, height: 60, alignment: .center)
                    .font(.title2.bold())
                    .foregroundColor(darkBrown)
                }
                
                Spacer().frame(width: 15)
                
                //TimeSignature selector
                ZStack{
                    Rectangle()
                        .foregroundColor(Color(red: 205/255, green: 150/255, blue: 100/255))
                        .frame(width: 70, height: 55, alignment: .center)
                        .cornerRadius(10)
                    Button("6/8"){
                        print("Open timesignature page")
                    }
                    .font(.title2.bold())
                    .foregroundColor(darkBrown)
                }
                
            }
            
            
            
        }.offset(y:-20)
        
    }
}

func tempoName(bpm: Int) -> String{
    if(bpm < 20){return "Larghissimo"}
    if(bpm < 40){return "Gravo"}
    if(bpm < 50){return "Lento"}
    if(bpm < 55){return "Largo"}
    if(bpm < 65){return "Adagio"}
    if(bpm < 70){return "Adagietto"}
    if(bpm < 80){return "Andante"}
    if(bpm < 100){return "Moderato"}
    if(bpm < 110){return "Allegretto"}
    if(bpm < 130){return "Allegro"}
    if(bpm < 140){return "Vivace"}
    if(bpm < 180){return "Presto"}
    return "Prestissimo"
}





struct MetronomeHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MetronomeHomeView(bpm: 60, barNotes: 1) //no pulses if 1
    }
}
