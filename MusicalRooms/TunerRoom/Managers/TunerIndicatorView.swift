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
        ScrollView{
            VStack {
                RoundedRectangle(cornerRadius: 20)
                        .frame(width: 370, height: 270, alignment: .center)
                        .foregroundColor(Color("evenLighterBrown"))
                        .overlay(
                                VStack(spacing: 1){
                                    let freqOffset = CGFloat(max(min(conductor.data.freqDistance*150, 150), -150))
                                    Rectangle()
                                            .cornerRadius(2)
                                            .frame(width: 5, height: 55)
                                            .foregroundColor(topLineColor)
                                            .offset(x: freqOffset, y: -15)

                                    Text((conductor.data.noteNameWithSharps).contains("♯") ? "\(conductor.data.noteNameWithSharps) / \(conductor.data.noteNameWithFlats)" : conductor.data.noteNameWithSharps)
                                            .fontWeight(.heavy)
                                            .font(Font.system(size: 30))
                                            .multilineTextAlignment(.center)

                                    FrequencyAdjusterView(variance: $variance)
                                    .padding(.vertical, 10)

                                    HStack{
                                        let amplitude = String(format: "%.1f", conductor.data.amplitude*100)
                                        let frequency = String(format: "%.1f", conductor.data.pitch)
                                        Text("\(amplitude) dB")
                                        Text("\(frequency) Hz")
                                    }

                                    Spacer().frame(height: 20)

                                    HStack{
                                        ForEach(0 ..< 11) { rectangle in
                                            Rectangle()
                                                    .cornerRadius(3)
                                                    .frame(
                                                            width: (rectangle==4||rectangle==6) ? 3 : 2,
                                                            height: (rectangle==4||rectangle==6) ? 40 : 17
                                                    )
                                                    .foregroundColor((rectangle==4||rectangle==6) ? .green : .black)
                                                    .offset(y: (rectangle==4||rectangle==6) ? 20 : 32)

                                        }.frame(width: 23, height: 50, alignment: .center)
                                    }
                                    .overlay(
                                            Rectangle()
                                                    .cornerRadius(2)
                                                    .frame(width: 5, height: 70)
                                                    .foregroundColor(bottomLineColor)
                                                    .offset(x:freqOffset, y: 5)
                                    )
                                }
                        )
            }
            .scaleEffect(min(1, 370/UIScreen.main.bounds.width))
            .padding(.horizontal, 30)
            .onAppear{
                self.conductor.start()
            }
            .onDisappear{
                self.conductor.stop()
            }
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
                    .foregroundColor(Color("darkBrown"))
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
                        .foregroundColor(Color("darkBrown"))
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
