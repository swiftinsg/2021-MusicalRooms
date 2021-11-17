//
//  PlayFrequency.swift
//  MusicalRooms
//
//  Created by Isaac Lee Jing Zhi on 17/11/21.
//

import Foundation
import AudioUnit
import AVFoundation

final class ToneOutputUnit: NSObject {
    var auAudioUnit: AUAudioUnit! = nil     // placeholder for RemoteIO Audio Unit
    
    var avActive     = false             // AVAudioSession active flag
    var audioRunning = false             // RemoteIO Audio Unit running flag
    
    var sampleRate : Double = 44100.0    // typical audio sample rate
    
    var f0  =    880.0              // default frequency of tone:   'A' above Concert A
    var v0  =  16383.0              // default volume of tone:      half full scale
    
    var toneCount : Int32 = 0       // number of samples of tone to play.  0 for silence
    
    private var phY =     0.0       // save phase of sine wave to prevent clicking
    private var interrupted = false     // for restart from audio interruption notification
    
    
    
    func setFrequency(freq : Double) {  // audio frequencies below 500 Hz may be
        f0 = freq                       //   hard to hear from a tiny iPhone speaker.
    }
    
    func setToneVolume(vol : Double) {  // 0.0 to 1.0
        v0 = vol * 32766.0
    }
    
    func setToneTime(t : Double) {
        toneCount = Int32(t * sampleRate);
    }
    
    func enableSpeaker() {
        if audioRunning {
            print("returned")
            return
        }           // return if RemoteIO is already running
        
        do {        // not running, so start hardware
            let audioComponentDescription = AudioComponentDescription(
                componentType: kAudioUnitType_Output,
                componentSubType: kAudioUnitSubType_SystemOutput, // For output to the local sound system
                componentManufacturer: kAudioUnitManufacturer_Apple,
                componentFlags: 0,
                componentFlagsMask: 0 )
            
            if (auAudioUnit == nil) {
                
               auAudioUnit = try AUAudioUnit(componentDescription: audioComponentDescription)
                
                let bus0 = auAudioUnit.inputBusses[0]
                
                let audioFormat = AVAudioFormat(
                    commonFormat: AVAudioCommonFormat.pcmFormatInt16,   // short int samples
                    sampleRate: Double(sampleRate),
                    channels:AVAudioChannelCount(2),
                    interleaved: true )                                 // interleaved stereo
                
                try bus0.setFormat(audioFormat ?? AVAudioFormat())  //      for speaker bus
                
                auAudioUnit.outputProvider = { (    //  AURenderPullInputBlock?
                    actionFlags,
                    timestamp,
                    frameCount,
                    inputBusNumber,
                    inputDataList ) -> AUAudioUnitStatus in
                    
                    self.fillSpeakerBuffer(inputDataList: inputDataList, frameCount: frameCount)
                    return(0)
                }
            }
                        
            auAudioUnit.isOutputEnabled = true
            toneCount = 0
            
            try auAudioUnit.allocateRenderResources()  //  v2 AudioUnitInitialize()
            try auAudioUnit.startHardware()            //  v2 AudioOutputUnitStart()
            audioRunning = true
        } catch /* let error as NSError */ {
            print("error 2 \(error)")
        }
    }
    
    // helper functions
    
    private func fillSpeakerBuffer(     // process RemoteIO Buffer for output
        inputDataList : UnsafeMutablePointer<AudioBufferList>, frameCount : UInt32 ) {
        let inputDataPtr = UnsafeMutableAudioBufferListPointer(inputDataList)
        let nBuffers = inputDataPtr.count
        if (nBuffers > 0) {
            
            let mBuffers : AudioBuffer = inputDataPtr[0]
            let count = Int(frameCount)
            
            // Speaker Output == play tone at frequency f0
            if  self.v0 > 0 && self.toneCount > 0 {
                // audioStalled = false
                
                var v  = self.v0 ; if v > 32767 { v = 32767 }
                let sz = Int(mBuffers.mDataByteSize)
                
                var a  = self.phY        // capture from object for use inside block
                let d  = 2.0 * Double.pi * self.f0 / self.sampleRate     // phase delta
                
                let bufferPointer = UnsafeMutableRawPointer(mBuffers.mData)
                if var bptr = bufferPointer {
                    for i in 0..<(count) {
                        let u  = sin(a)             // create a sinewave
                        a += d ; if (a > 2.0 * Double.pi) { a -= 2.0 * Double.pi }
                        let x = Int16(v * u + 0.5)      // scale & round
                        
                        if (i < (sz / 2)) {
                            bptr.assumingMemoryBound(to: Int16.self).pointee = x
                            bptr += 2   // increment by 2 bytes for next Int16 item
                            bptr.assumingMemoryBound(to: Int16.self).pointee = x
                            bptr += 2   // stereo, so fill both Left & Right channels
                        }
                    }
                }
                
                self.phY        =   a                   // save sinewave phase
                self.toneCount  -=  Int32(frameCount)   // decrement time remaining
            } else {
                // audioStalled = true
                memset(mBuffers.mData, 0, Int(mBuffers.mDataByteSize))  // silence
            }
        }
    }
    
    func stop() {
        if (audioRunning) {
            auAudioUnit.stopHardware()
            audioRunning = false
        }
    }
}
