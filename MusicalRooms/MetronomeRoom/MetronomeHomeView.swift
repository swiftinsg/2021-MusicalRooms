//
//  MetronomeHomeView.swift
//  MusicalRooms
//
//  Created by sap on 15/11/21.
//

import SwiftUI

struct MetronomeHomeView: View {

    
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
        NavigationView{
            VStack {
                
                let internalHeight = CGFloat(300) //DO NOT CHANGE, other values are not reactive
                let scaledHeight = UIScreen.main.bounds.height * 0.35
                // Arm
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("primary"))
                        .frame(width: 8, height: 300, alignment: .center)
                        .cornerRadius(2)
                    
                    Circle()
                        .foregroundColor(Color("primary"))
                        .frame(width: 20, height: 20, alignment: .center)
                        .offset(y: weightOffset)
                        .gesture(
                            DragGesture(minimumDistance: 0.1)
                                .onChanged({value in
                                    weightOffset = CGFloat(min(max(lastWeightOffset + value.translation.height, -120), 158.6))

                                    let newBpm: Double = -(Double(weightOffset)-160)*200/280
                                    withAnimation(.easeInOut(duration: 0.1)){
                                        bpm = Int(newBpm)
                                    }
                                })
                                .onEnded({value in
                                    lastWeightOffset = weightOffset
                                })
                        )
                    
                }
                .scaleEffect(min(1, scaledHeight / internalHeight))
                .frame(height: min(internalHeight, scaledHeight))
                .rotationEffect(Angle.degrees(armAngle), anchor: .bottom)
                .onChange(of: bpm, perform: {bpm in
                    withAnimation(.easeInOut(duration: 0.2)){
                        weightOffset = CGFloat( -bpm*280/200 + 160)
                    }
                })
                
                // Tempo name
                Text(tempoName(bpm: bpm))
                    .bold()
                    .font(.title3)
                    .foregroundColor(Color("fg"))
                    .padding(.bottom)
                
                
                // BPM modifier
                HStack {
                    Spacer()
                    
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)){
                            if bpm > 1 { bpm -= 1 }
                            updateOffsetFromBPM()
                        }
                    } label: {
                        Image(systemName: "minus")
                    }
                    .padding(.leading)
                    .foregroundColor(Color("fg"))
                    .font(.title2.bold())
                    
                    Spacer()
                    
                    Text("\(bpm)")
                        .frame(width: 70, height: 20)
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(Color("fg"))
                        .onTapGesture{
                            displayNumpad.toggle()
                        }
                        .sheet(isPresented: $displayNumpad) {
                            BpmNumpadView(bpm: $bpm, updateBPM: $updateBPM)
                        }
                        .padding(.vertical)
                    
                    Spacer()
                    
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)){
                            if bpm < 230 { bpm += 1 }
                            updateOffsetFromBPM()
                        }
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding(.trailing)
                    .font(.title2.bold())
                    .foregroundColor(Color("fg"))
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(Color("secondary"))
                .cornerRadius(10)
                
                HStack {
                    //Play Button
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)){
                            isOn.toggle()
                        }
                        print("Toggle metronome")
                    } label: {
                        HStack{
                            Spacer()
                            if isOn{
                                Image(systemName: "stop.fill")
                                    .foregroundColor(Color("fg"))
                                    .padding()
                            } else {
                                Image(systemName: "play.fill")
                                    .foregroundColor(Color("fg"))
                                    .padding()
                            }
                            Spacer()
                        }
                        .background(Color("secondary"))
                        .cornerRadius(10)
                        .padding(.vertical)
                    }
                    .font(.title2.bold())
                    .foregroundColor(Color("fg"))
                    .onChange(of: isOn){ value in
                        if(isOn){start()}
                        else {
                            timer.invalidate()
                            soundDelayTimer.invalidate()
                            endSwing()
                        }
                    }
                    Spacer()
                    
                    //Time Signature Selector
                    Button {
                        displaySigSelect.toggle()
                    } label: {
                        ZStack {
                            Text(signatures[sigIndex])
                                .bold()
                                .font(.title2)
                                .foregroundColor(Color("fg"))
                                .padding()
                                .background(Color("secondary"))
                                .cornerRadius(10)
                        }.offset(x: 10)
                        .padding(.vertical)
                    }
                    .background(Color.clear)
                    .onChange(of: sigIndex){index in
                        barNotes = sigNotes[sigIndex]
                    }
                    .sheet(isPresented: $displaySigSelect) {
                        TimeSigSelectView(selIndex:$sigIndex)
                    }
                    
                    Spacer().frame(width: 15)
                }
            }
            .padding()
            .navigationBarTitle("Metronome")
        }
    }
    
    func updateOffsetFromBPM(){
        weightOffset = CGFloat( -bpm*280/200 + 160)
    }
    
    
    
    // *********** Metronome tick & sound functions ********
    
    @State var soundDelayTimer: Timer
    @State var timer: Timer
    @State var note:Int = 1
    
    @State var metrSound = AudioPlayer()
    @StateObject var metrUpSound = AudioPlayer()
    
    func start(){
        barNotes = sigNotes[sigIndex]
        note = 1
        
        isOn = true
        self.tick()
    }
    
    func tick(){
        if !isOn {return}
        
        var delay:Double = Double(60)/Double(bpm)
        if armAngle == 0 {
            delay = delay * 0.55
        }
        swing(delay: delay)
        
        let soundDelay = armAngle != 0 ? delay*0.72 : 0.0
        soundDelayTimer = Timer.scheduledTimer(withTimeInterval: soundDelay, repeats: false) { timer in
            sound()
        }
        
        if(note < barNotes){note+=1}
        else{ note = 1 }
        
        timer = Timer.scheduledTimer(withTimeInterval: delay, repeats: false) { timer in
            self.tick()
        }
    }
    
    func sound(){
        let isOne = barNotes==1
        let isPulse = !isOne && note==1
        
        let metrUrl = Bundle.main.url(forResource: "metronome", withExtension: ".wav")!
        let metrUpUrl = Bundle.main.url(forResource: "metronomeUp", withExtension: ".wav")!
        
        isPulse ? metrSound.startPlayback(audio: metrUpUrl) : metrUpSound.startPlayback(audio: metrUrl)
    }
    
    func swing(delay: Double) {
        let nextAngle = armAngle == 0 ? 30 : -armAngle
        withAnimation(.easeInOut(duration: delay)) {
            armAngle = nextAngle
        }
    }
    
    func endSwing() {
        withAnimation(.easeInOut(duration: 2.0)){
            armAngle = 0
        }
    }
    
    // Just a value to fill the timer var first
    init() {
        self.timer = Timer(timeInterval: 0.1, repeats: false) { timer in
            print("Metronome initialised")
        }
        self.soundDelayTimer = Timer(timeInterval: 0.01, repeats: false) { timer in
            print("")
        }
        
        barNotes = sigNotes[sigIndex]
    }
}

struct MetronomeHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MetronomeHomeView()
    }
}
