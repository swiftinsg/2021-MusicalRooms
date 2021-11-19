//
//  ActualTunerView.swift
//  MusicalRooms
//
//  Created by Isaac Lee Jing Zhi on 19/11/21.
//

import SwiftUI

struct TunerView: View {
    
    @State var AFrequency = 440.0
    @Binding var variance: Float
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 350, height: 160, alignment: .center)
                .foregroundColor(Color("lightBrown"))
                .overlay(
                    VStack {
                        HStack {
                            Button {
                                AFrequency += 5; variance += 5
                            } label: {
                                Circle()
                                    .frame(width: 25, height: 25, alignment: .center)
                                    .foregroundColor(Color("darkBrown"))
                                    .overlay(
                                        Image(systemName: "plus")
                                            .foregroundColor(Color("lightBrown"))
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
                                                .foregroundColor(Color("lightBrown"))
                                            )
                                }
                            }
                        }
                    }
                )
        }
    }
}

struct TunerView_Previews: PreviewProvider {
    static var previews: some View {
        TunerView(variance: .constant(0))
    }
}
