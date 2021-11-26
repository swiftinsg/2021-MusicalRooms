//
//  ActualTunerView.swift
//  MusicalRooms
//
//  Created by Isaac Lee Jing Zhi on 19/11/21.
//

import SwiftUI

struct ActualTunerView: View {

    @StateObject var conductor = TunerConductor()

    @State var frequency = 440
    let topLineColor: Color = Color("topLineColor")
    let bottomLineColor: Color = Color("bottomLineColor")
    
    var tuner = TunerData()
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color("evenLighterBrown"))
                .overlay(
                    VStack {
                        let freqOffset = CGFloat(max(min(conductor.data.freqDistance*150, 150), -150))
                        Rectangle()
                            .frame(width: 3, height: 35)
                            .foregroundColor(topLineColor)
                            .offset(x: freqOffset)

                        Text((conductor.data.noteNameWithSharps).contains("♯") ? "\(conductor.data.noteNameWithSharps) / \(conductor.data.noteNameWithFlats)" : conductor.data.noteNameWithSharps)
                            .fontWeight(.heavy)
                            .font(Font.system(size: 30))

                        Spacer().frame(height: 10)
                        HStack{
                            let amplitude = String(format: "%.2f", fabsf(20 * log10(fabsf(1/conductor.data.amplitude)))  )
                            Text("\(amplitude) dB")

                            let frequency = String(format: "%.2f", conductor.data.pitch)
                            Text("\(frequency) Hz")
                        }


                        HStack {
                            ForEach(0 ..< 11) { rectangle in
                                Rectangle()
                                    .frame(
                                            width: (rectangle==4||rectangle==6) ? 3 : 2,
                                            height: (rectangle==4||rectangle==6) ? 40 : 25
                                    )
                                    .foregroundColor((rectangle==4||rectangle==6) ? .green : .black)
                                    .offset(y: (rectangle==4||rectangle==6) ? 5 : 12.5)
                                
                            }
                            .frame(width: 23, height: 50, alignment: .center)
                        }
                        .overlay(
                            Rectangle()
                                .frame(width: 3, height: 50)
                                .foregroundColor(bottomLineColor)
                                .offset(x:freqOffset, y: -1.5)
                        )
                    }
                )
        }
        .padding(.leading, 30)
        .padding(.trailing, 30)
        .onAppear{
            self.conductor.start()
        }
        .onDisappear{
            self.conductor.stop()
        }
    }
}

struct TunerView_Previews: PreviewProvider {
    static var previews: some View {
        ActualTunerView()
    }
}
