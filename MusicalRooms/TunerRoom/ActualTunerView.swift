//
//  ActualTunerView.swift
//  MusicalRooms
//
//  Created by Isaac Lee Jing Zhi on 19/11/21.
//

import SwiftUI
import Tuna

struct ActualTunaView: View {
    
    @State var AFrequency = 440.0
    @Binding var variance: Float
    
    let topLineColor: Color = Color("topLineColor")
    let bottomLineColor: Color = Color("bottomLineColor")
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 350, height: 160, alignment: .center)
                .foregroundColor(Color("evenLighterBrown"))
                .overlay(
                    VStack {
                        Rectangle()
                            .frame(width: 2, height: 35)
                            .foregroundColor(topLineColor)
                        HStack {
                            Button {
                                AFrequency += 5; variance += 5
                            } label: {
                                Circle()
                                    .frame(width: 25, height: 25, alignment: .center)
                                    .foregroundColor(Color("darkBrown"))
                                    .overlay(
                                        Image(systemName: "plus")
                                            .foregroundColor(Color("evenLighterBrown"))
                                        )
                            }
                            
                            VStack {
                                
                                Text("A") //Placeholder text
                                    .fontWeight(.heavy)
                                    .font(Font.system(size: 30))
                                Text(String(AFrequency) + "Hz")
                                    .fontWeight(.bold)
                                    .font(Font.system(size: 10))
                                    .foregroundColor(Color("darkerBrown"))
                            }
                            
                            HStack {
                                Button {
                                    AFrequency -= 5; variance -= 5
                                } label: {
                                    Circle()
                                        .frame(width: 25, height: 25, alignment: .center)
                                        .foregroundColor(Color("darkBrown"))
                                        .overlay(
                                            Image(systemName: "minus")
                                                .foregroundColor(Color("evenLighterBrown"))
                                            )
                                }
                            }
                        }
                        HStack {
                            ForEach(0 ..< 11) { rectangle in
                                Rectangle()
                                    .frame(
                                    width: 2,
                                    height: rectangle == 5 ? 50 : 25
                                    )
                                    .foregroundColor(rectangle == 5 ? bottomLineColor : .black )
                                    .offset(y: rectangle != 5 ? 15 : 3)
                                    
                            }
                            .frame(width: 23, height: 50, alignment: .center)
                        }
                    }
                        
                )
        }
    }
}

struct TunerView_Previews: PreviewProvider {
    static var previews: some View {
        ActualTunaView(variance: .constant(0))
    }
}
