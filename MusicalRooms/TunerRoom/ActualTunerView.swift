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
                            Circle()
                                .frame(width: 25, height: 25, alignment: .center)
                                .foregroundColor(Color("darkBrown"))
                                .overlay(
                                Image(systemName: "plus")
                                    .foregroundColor(Color("lightBrown"))
                                )
                                .onTapGesture {
                                    AFrequency += 5; variance += 5
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
