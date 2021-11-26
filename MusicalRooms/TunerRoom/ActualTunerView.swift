//
//  ActualTunerView.swift
//  MusicalRooms
//
//  Created by Isaac Lee Jing Zhi on 19/11/21.
//

import SwiftUI

struct ActualTunerView: View {
    
    @State var frequency = 440
    let topLineColor: Color = Color("topLineColor")
    let bottomLineColor: Color = Color("bottomLineColor")
    
    var tuner = TunerData()
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 350, height: 180, alignment: .center)
                .foregroundColor(Color("evenLighterBrown"))
                .overlay(
                    VStack {
                        Rectangle()
                            .frame(width: 2, height: 35)
                            .foregroundColor(topLineColor)
                        
                        Text("A") //Placeholder text
                            .fontWeight(.heavy)
                            .font(Font.system(size: 30))
                        Text(String(frequency) + "Hz")
                            .fontWeight(.bold)
                            .font(Font.system(size: 10))
                            .foregroundColor(Color("darkerBrown"))
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
        ActualTunerView()
    }
}
