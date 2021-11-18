//
//  MetronomeHomeView.swift
//  MusicalRooms
//
//  Created by sap on 15/11/21.
//

import SwiftUI
import Subsonic

struct MetronomeHomeView: View {

    let lightBrown: Color = Color(red: 131/255, green: 78/255, blue: 44/255, opacity: 1.0)
    let darkBrown: Color = Color(red: 70/255, green: 27/255, blue: 0, opacity: 1.0)
    let backBrown: Color = Color(red: 211/255, green: 165/255, blue: 109/255)

    @State var bpm: Int = 60
    @State var barNotes: Int = 1
    @State var isOn: Bool = false
    @State var armAngle:Double = 0
    
    @State var weightOffset: CGFloat = 76
    @State var lastWeightOffset: CGFloat = 76
    @State var updateBPM: Bool = false
    //Set to true from other files to update the arm offset

    @AppStorage("sigIndex") var sigIndex: Int = 0
    let signatures = ["1/4", "2/4", "3/4", "4/4", "5/4", "6/4", "3/8", "5/8", "6/8", "7/8", "9/8", "12/8"]
    let sigNotes = [1, 2, 3, 4, 5, 6, 3, 5, 6, 7, 9, 12]

    @State var displayNumpad: Bool = false
    @State var displaySigSelect: Bool = false

    @State var minusButtonSize: CGFloat = 1.0
    @State var plusButtonSize: CGFloat = 1.0
    @State var playButtonSize: CGFloat = 1.0
    
    var body: some View {
        
        VStack{
            Text("Metronome")
                .font(Font.system(size: 32, weight: .bold))
                .frame( alignment: .leading)
                .offset(x:-65,y:-10)
                .padding()

            Spacer()
                .frame(height: 30)
            
            // Arm
            ZStack {
                Rectangle()
                    .foregroundColor(lightBrown)
                    .frame(width: 7, height: 300, alignment: .center)
                    .cornerRadius(2)
                
                Circle()
                    .foregroundColor(lightBrown)
                    .frame(width: 20, height: 20, alignment: .center)
                    .offset(y: weightOffset)
                    .gesture(
                        DragGesture(minimumDistance: 0.1)
                            .onChanged({value in
                                weightOffset = CGFloat(min(max(lastWeightOffset + value.translation.height, -120), 158.6))
                                
                                let newBpm: Double = -(Double(weightOffset)-160)*200/280
                                bpm = Int(newBpm)
                            })
                            .onEnded({value in
                                lastWeightOffset = weightOffset
                            })
                    )
                
            }.rotationEffect(Angle.degrees(armAngle), anchor: .bottom)
                .onChange(of: bpm, perform: {bpm in
                    weightOffset = CGFloat( -bpm*280/200 + 160) //-120:160
                })
                /*.onChange(of: updateBPM, perform: {bpm in
                    if(update == true) {
                        updateOffsetFromBPM()
                        update = false
                    }
                })*/
            
            
            Spacer().frame(height:25)


            // Tempo name
            Text(tempoName(bpm: bpm))
                .bold()
                .font(.title3)
                .foregroundColor(lightBrown)

            Spacer()
                .frame(height:45)

            // BPM modifier
            ZStack {
                Rectangle()
                    .foregroundColor(backBrown)
                    .frame(width: 280, height: 60, alignment: .center)
                    .cornerRadius(10)

                Button {
                    if (bpm > 1) { bpm -= 1 }
                    updateOffsetFromBPM()
                    print("Minus bpm")
                    
                } label: {
                    ZStack{
                        Rectangle()
                            .foregroundColor(backBrown)
                            .frame(width: 60, height: 60, alignment: .center)
                        Image(systemName: "minus")
                    }
                }
                .foregroundColor(darkBrown)
                .font(.title2.bold())
                .offset(x: -95)

                Text("\(bpm)")
                    .font(.title.bold())
                    .foregroundColor(darkBrown)
                    .frame(width: 60, height: 60, alignment: .center)
                    .onTapGesture{
                        displayNumpad.toggle()
                    }
                    .sheet(isPresented: $displayNumpad) {
                        BpmNumpadView(bpm: $bpm, updateBPM: $updateBPM)
                    }


                Button {
                    if (bpm < 230) { bpm += 1 }
                    updateOffsetFromBPM()
                    print("Plus bpm")
                } label: {
                    ZStack{
                        Rectangle()
                            .foregroundColor(backBrown)
                            .frame(width: 60, height: 60, alignment: .center)
                        Image(systemName: "plus")
                    }
                }
                .font(.title2.bold())
                .foregroundColor(darkBrown)
                .offset(x: 95)
            }

            Spacer()
                .frame(height: 40)

            HStack {
                //Play Button
                Button {
                    isOn.toggle()
                    print("Toggle metronome")
                } label: {
                    ZStack{
                        Rectangle()
                            .foregroundColor(backBrown)
                            .frame(width: 205, height: 60, alignment: .center)
                            .cornerRadius(10)
                        if isOn {
                            Image(systemName: "pause.fill")
                        } else {
                            Image(systemName: "play.fill")
                        }
                    }
                }
                .font(.title2.bold())
                .foregroundColor(darkBrown)
                .onChange(of: isOn){ value in
                    if(isOn){start()}
                    else {
                        timer.invalidate()
                        endSwing()
                    }
                }

                Spacer()
                    .frame(width: 15)

                //Time Signature Selector
                    Button {
                        print("Open timesignature page")
                        print("\(sigIndex), \(signatures)")
                        
                        displaySigSelect.toggle()
                    } label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(backBrown)
                                .frame(width: 70, height: 60, alignment: .center)
                                .cornerRadius(10)
                            
                            Text(signatures[sigIndex])
                                .bold()
                                .font(.title2)
                                .foregroundColor(darkBrown)
                        }
                    }
                    .onChange(of: sigIndex){index in
                        barNotes = sigNotes[sigIndex]
                    }
                    .frame(width: 60, alignment: .center)
                    .sheet(isPresented: $displaySigSelect) {
                        TimeSigSelectView(selIndex:$sigIndex)
                    }
            }
        }
        .offset(y:-20)
    }
    
    func updateOffsetFromBPM(){
        weightOffset = CGFloat( -bpm*280/200 + 160)
    }
    
    
    
    
    // *********** Metronome tick & sound functions ********
    
    @State var timer: Timer
    @State var note:Int = 1
    
    @StateObject var metrSound = SubsonicPlayer(sound: "metronome.wav")
    @StateObject var metrUpSound = SubsonicPlayer(sound: "metronomeUp.wav")
    
    
    
    func start(){
        barNotes = sigNotes[sigIndex]
        
        isOn = true
        self.tick()
    }
    
    func tick(){
        if(!isOn){return}
        
        let delay:Double = Double(60)/Double(bpm)
        swing(delay: delay)
        
        let soundDelay = delay*0.78
        Timer.scheduledTimer(withTimeInterval: soundDelay, repeats: false, block: {timer in
            sound()
        })
        
        if(note < barNotes){note+=1}
        else{ note = 1 }
        
        timer = Timer.scheduledTimer(withTimeInterval: delay, repeats: false, block: {timer in
            self.tick()
        })
    }
    
    func sound(){
        var isPulse = false
        if(barNotes != 1 && note == 1){ isPulse = true }
        
        isPulse ? metrUpSound.play() : metrSound.play()
    }
    
    func swing(delay: Double){
        let nextAngle = armAngle == 0 ? 30 : -armAngle
        
        withAnimation(.easeInOut(duration: delay)){
            armAngle = nextAngle
        }
    }
    
    func endSwing(){
        withAnimation(.easeInOut(duration: 2.0)){
            armAngle = 0
        }
    }
    
    // Just a value to fill the timer var first
    init(){
        self.timer = Timer(timeInterval: 0.1, repeats: false, block: {timer in
            print("Metronome initialised")
        })
        barNotes = sigNotes[sigIndex]
    }
    
    
}





func tempoName(bpm: Int) -> String {
    if(bpm < 20){ return "Larghissimo" }
    else if(bpm < 40){ return "Gravo" }
    else if(bpm < 50){ return "Lento" }
    else if(bpm < 55){ return "Largo" }
    else if(bpm < 65){ return "Adagio" }
    else if(bpm < 70){ return "Adagietto" }
    else if(bpm < 80){ return "Andante" }
    else if(bpm < 100){ return "Moderato" }
    else if(bpm < 110){ return "Allegretto" }
    else if(bpm < 130){ return "Allegro" }
    else if(bpm < 140){ return "Vivace" }
    else if(bpm < 180){ return "Presto" }
    else { return "Prestissimo" }
}

struct MetronomeHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MetronomeHomeView()
    }
}
