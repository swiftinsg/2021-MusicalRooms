//
//  ActualResultsView.swift
//  MusicalRooms
//
//  Created by Chelsea Ling on 24/11/21.
//

import SwiftUI

struct ActualResultsView: View {
    

    @Binding var grades: [Grade]
    @State var percentCorrect: Int = 50
       
       var body: some View {
           VStack {
               Text("\(percentCorrect)%")
                   .multilineTextAlignment(.leading)
                   .font(Font.system(size: 40, weight: .semibold, design: .rounded))
                   .lineLimit(3)
                   .foregroundColor(Color("darkerBrown"))
               
                   .overlay(
               ResultsView(progress: CGFloat(percentCorrect)/CGFloat(100-percentCorrect))
                   .frame(width: 200, height: 200)
                   )
           }
       }
   }

struct ActualResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ActualResultsView(grades: .constant([
            Grade(number: 1, percentageCorrect: 0),
            Grade(number: 4, percentageCorrect: 0),
            Grade(number: 5, percentageCorrect: 0)]))
    }
}
