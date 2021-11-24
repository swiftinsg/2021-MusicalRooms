//
//  ResultsView.swift
//  MusicalRooms
//
//  Created by Chelsea Ling on 24/11/21.
//

import SwiftUI

struct ResultsView: View {
    
    var progress: CGFloat
       
       var body: some View {
           ZStack {
               Circle()
                   .stroke(lineWidth: 20)
                   .foregroundColor(Color("lightRed"))
               
               Circle()
                   .trim(from: 0, to: progress)
                   .stroke(style: .init(lineWidth: 20.0,
                                        lineCap: .round,
                                        lineJoin: .round))
                   .foregroundColor(Color("lightGreen"))
                   .rotationEffect(Angle(degrees: 270))
           }
       }
   }

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(progress:0.25)
        
    }
}
