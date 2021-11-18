//
//  RecorderHomeView.swift
//  MusicalRooms
//
//  Created by sap on 18/11/21.
//

import SwiftUI
import AVFoundation
import Subsonic

struct RecorderHomeView: View {
    
    let lightBrown: Color = Color(red: 131/255, green: 78/255, blue: 44/255, opacity: 1.0)
    let darkBrown: Color = Color(red: 70/255, green: 27/255, blue: 0, opacity: 1.0)
    let backBrown: Color = Color(red: 211/255, green: 165/255, blue: 109/255)
    
    @State var recordButtonSize: CGFloat = 60
    @State var recordBorderWidth: CGFloat = 3
    @State var recordButtonBorder: CGFloat = 75
    @State var recordButtonRadius: CGFloat = 30
    
    @State var isRecording: Bool = false
    
    @State var audioExists: Bool = true //ChANGE
    @State var audioPosition: Int = 0
    @State var audioLength: Int = 10*60 //CHANGE
    
    @State var sliderOffset: CGFloat = 0.0
    @State var lastSliderOffset: CGFloat = 0.0
    
    @State var isPlaying: Bool = false
    
    var body: some View {
        
        VStack{
            
            Text("Recorder")
                .font(Font.system(size: 32, weight: .bold))
                .frame( alignment: .leading)
                .offset(x:-65,y:-10)
                .padding()
            Spacer().frame(height:60)
            
            
            let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            //TODO: List of recorded clips & attached controls below
            
            
            
            
            if audioExists {
                
                // Audio track for indication & scrubbing
                ZStack{
                    Text("\(String(format: "%02d", audioPosition/60)):\(String(format: "%02d", audioPosition%60))") //Truncate to 2dp
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundColor(lightBrown)
                        .offset(x: -130,y: -25)
                    
                    // Slider
                    Rectangle()
                        .fill(LinearGradient(
                            gradient: Gradient(stops: [
                                Gradient.Stop(color: backBrown, location: (sliderOffset+15)/300),
                                Gradient.Stop(color: .gray, location: (sliderOffset+15)/300)
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing)
                        )
                        .frame(width: 300, height: 5, alignment: .center)
                        .cornerRadius(10)
                    Circle()
                        .foregroundColor(backBrown)
                        .frame(width: 12, height: 12, alignment: .center)
                        .offset(x: sliderOffset-138)
                        .gesture(
                            DragGesture(minimumDistance: 0.0)
                                .onChanged({value in
                                    let newOffset = lastSliderOffset + value.translation.width
                                    sliderOffset = max(min(newOffset, 276), 0)
                                    
                                    audioPosition = Int(round(sliderOffset/276.0 * CGFloat(audioLength)))
                                })
                                .onEnded({value in
                                    lastSliderOffset = sliderOffset
                                })
                        )
                    
                    let reversePosition = audioLength-audioPosition
                    Text("\(String(format: "%02d", reversePosition/60)):\(String(format: "%02d", reversePosition%60))") //Truncate to 2dp
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundColor(lightBrown)
                        .offset(x: 125, y: -25)
                }
                Spacer().frame(height: 20)
                
                
                // Playback controls
                HStack{
                    
                    // Back 15s
                    Button{
                        audioPosition = max(min(audioPosition - 15, audioLength), 0)
                        updateSliderOffset()
                    }label: {
                        Text("\(Image(systemName: "gobackward.15"))")
                            .foregroundColor(darkBrown)
                            .font(.system(size: 22))
                    }
                    Spacer().frame(width:30)
                    
                    // Play
                    Button{
                        isPlaying.toggle()
                    } label: {
                        Text("\(Image(systemName: isPlaying ? "play.fill" : "pause.fill"))")
                            .foregroundColor(darkBrown)
                            .font(.system(size: 22))
                    }
                    Spacer().frame(width:30)
                    
                    // Forward 15s
                    Button{
                        audioPosition = max(min(audioPosition + 15, audioLength), 0)
                        updateSliderOffset()
                    }label: {
                        Text("\(Image(systemName: "goforward.15"))")
                            .foregroundColor(darkBrown)
                            .font(.system(size: 22))
                    }
                    
                }
                
                
            } else {
                //Empty
                Text("No recording")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(darkBrown)
                    .padding(40)
            }
            
            Spacer().frame(height:30)
            
            
            
            Spacer().frame(height:30)
            
            // Record button
            Button{
                isRecording.toggle()
                
                if(isRecording){
                    startRecording()
                }else{
                    stopRecording()
                }
                
            } label: {
                ZStack{
                    Circle()
                        .stroke(backBrown, lineWidth: recordBorderWidth)
                        .frame(width: 70, height: 70, alignment: .center)
                    Rectangle()
                        .fill(lightBrown)
                        .frame(width: recordButtonSize, height: recordButtonSize, alignment: .center)
                        .cornerRadius(recordButtonRadius)
                }
            }.onChange(of: isRecording, perform: {isRecording in //Button indicates recording or not
                if(isRecording){
                    withAnimation(.easeInOut(duration: 0.2)){
                        recordButtonSize = 30
                        recordBorderWidth = 5
                        recordButtonBorder = 90
                        recordButtonRadius = 8
                    }
                }else{
                    withAnimation(.easeInOut(duration: 0.2)){
                        recordButtonSize = 60
                        recordBorderWidth = 3
                        recordButtonBorder = 75
                        recordButtonRadius = 30
                    }
                }
            })
            
            
            
        }
        
    }
    
    
    
    
    //funcs
    func updateSliderOffset(){
        sliderOffset = CGFloat(276 * audioPosition/audioLength)
    }
    
    
    
    
    // ********* Audio recording **********
    
    @State var audioRecorder: AVAudioRecorder!
    
    
    func startRecording(){
        
        isRecording = true
        let audioSession = AVAudioSession.sharedInstance()
        
        do{
            try audioSession.setCategory(.record, mode: .default)
            try audioSession.setActive(true)
        }catch{ print("Failed to setup recording session") }
        
        let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileName = filePath.appendingPathComponent("\(Date().toString(dateFormat: "dd-MM-YY_'at'_HH:mm:ss")).m4a")
        
        let audioSettings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do{
            audioRecorder = try AVAudioRecorder(url: fileName, settings: audioSettings)
            audioRecorder.record()
        }catch{ print("Failed to start recording") }
        
    }
    
    
    func stopRecording(){
        isRecording = false
        audioRecorder.stop()
    }
    
    
    
    
}






struct RecorderHomeView_Previews: PreviewProvider {
    static var previews: some View {
        RecorderHomeView()
    }
}
