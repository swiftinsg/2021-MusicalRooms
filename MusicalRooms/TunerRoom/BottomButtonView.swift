//
//  BottomButtonView.swift
//  MusicalRooms
//
//  Created by Isaac Lee Jing Zhi on 18/11/21.
//

import SwiftUI
import AudioKit

struct BottomButtonView: View {
    
    @State var isTunerOn = false
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Text("Start Tuning")
                    .font(.system(size: 20, design: .rounded))
                    .bold()
                    .foregroundColor(Color("darkBrown"))
                    .frame(width: 200, height: 100, alignment: .center)
                    .background(Color("evenLighterBrown"))
                    .cornerRadius(20)
            }
        }
    }
}

struct BottomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BottomButtonView()
    }
}
