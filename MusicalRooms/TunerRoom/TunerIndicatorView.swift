//
//  ActualTunerView.swift
//  MusicalRooms
//
//  Created by Isaac Lee Jing Zhi on 19/11/21.
//

import SwiftUI

struct TunerIndicatorView: View {

    @StateObject var conductor = TunerConductor()

    @Binding var variance: Float
    let topLineColor: Color = Color("topLineColor")
    let bottomLineColor: Color = Color("bottomLineColor")

    var tuner = TunerData()

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                    .frame(width: 370, height: 230, alignment: .center)
                    .foregroundColor(Color("secondary"))
                    .overlay(
                            VStack{
                                let freqOffset = CGFloat(max(min(conductor.data.freqDistance*150, 150), -150))
                                Rectangle()
                                        .cornerRadius(2)
                                        .frame(width: 5, height: 35)
                                        .foregroundColor(topLineColor)
                                        .offset(x: freqOffset, y: -3)

                                Text((conductor.data.noteNameWithSharps).contains("♯") ? "\(conductor.data.noteNameWithSharps) / \(conductor.data.noteNameWithFlats)" : conductor.data.noteNameWithSharps)
                                        .fontWeight(.heavy)
                                        .font(Font.system(size: 30))
                                        .multilineTextAlignment(.center)

                                FrequencyAdjusterView(variance: $variance)
                                    .padding(.vertical, 1)
                                    .offset(y: -1)
                                
                                HStack{
                                    let amplitude = String(format: "%.1f", conductor.data.amplitude*100)
                                    let frequency = String(format: "%.1f", conductor.data.pitch)
                                    Text("\(amplitude) dB")
                                    Text("\(frequency) Hz")
                                }

                                Spacer().frame(height: 10)

                                HStack{
                                    ForEach(0 ..< 11) { rectangle in
                                        let isIndicator = rectangle==4 || rectangle==6
                                        Rectangle()
                                                .cornerRadius(3)
                                                .frame(
                                                        width: (isIndicator) ? 3 : 2,
                                                        height: (isIndicator) ? 23 : 17
                                                )
                                                .foregroundColor(isIndicator ? .green : .black)
                                                .offset(y: (isIndicator) ? 17 : 19)

                                    }.frame(width: 23, height: 50, alignment: .center)
                                }
                                .overlay(
                                        Rectangle()
                                                .cornerRadius(2)
                                                .frame(width: 5, height: 42)
                                                .foregroundColor(bottomLineColor)
                                                .offset(x:freqOffset, y: 7)
                                )
                            }
                    )
        }
        .scaleEffect((UIScreen.main.bounds.width-30) / 370) // A series of bodges to make a frame layout responsive kill me pls
        .frame(height: (UIScreen.main.bounds.width-30)/370 * 230)
        .padding(.horizontal, 30)
        .padding(.vertical, 5)
        .onAppear{
            self.conductor.start()
        }
        .onDisappear{
            self.conductor.stop()
        }
    }
}


struct FrequencyAdjusterView: View{
    @Binding var variance: Float
    var body: some View{
        HStack{

            Button{
                withAnimation(.easeInOut(duration: 0.3)){
                    variance -= 1
                }
            } label: {
                Text("\(Image(systemName: "minus.rectangle.fill"))")
                    .foregroundColor(Color("primary"))
                    .font(.system(size: 26, weight: .semibold))
            }

            Text("A : \( String(format: "%.1f", 440+variance) )")
            .padding(.horizontal, 15)

            Button{
                withAnimation(.easeInOut(duration: 0.3)){
                    variance += 1
                }
            } label: {
                Text("\(Image(systemName: "plus.rectangle.fill"))")
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 26, weight: .semibold))
            }

        }
    }
}


struct TunerView_Previews: PreviewProvider {
    static var previews: some View {
        TunerHomeView()
    }
}
