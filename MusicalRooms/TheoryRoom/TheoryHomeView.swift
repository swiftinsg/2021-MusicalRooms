//
//  TheoryHomeView.swift
//  MusicalRooms
//
//  Created by sap on 15/11/21.
//

import SwiftUI

struct TheoryHomeView: View {
    
    @Binding var grades: [Grade]
    
    @State var percentCorrect: Double = 50
    
    var body: some View {
        NavigationView {
            VStack {
                ForEach($grades) { $grade in
                    NavigationLink {
                        OverviewView(words: $grade.words)
                    } label: {
                        VStack(alignment: .leading) {
                            HStack(alignment: .bottom) {
                                Text("Grade \(grade.number)")
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 25, design: .rounded))
                                    .lineLimit(3)
                                    .foregroundColor(Color("darkerBrown"))
                                
                                Text(String(format: "%.2f", grade.percentageCorrect) + "%")
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 25, design: .rounded))
                                    .lineLimit(3)
                                    .foregroundColor(Color("darkerBrown"))
                                    .offset(x: 100)
                                
                            }
                            .offset(y: -20)
                            
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color("darkLightBrown"))
                                .frame(width: 300, height: 10, alignment: .leading)
                                .overlay(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color("darkBrown"))
                                        .frame(width: (grade.percentageCorrect / 100 * 300))
                                }
                        }
                        .padding()
                        .frame(width: 330, height: 135, alignment: .leading)
                        .background(Color("lightBrown"))
                        .cornerRadius(10)
                    }
                    .frame(width: 400)
                }
                .offset(y:20)
            }
        }
    }
}


struct TheoryHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TheoryHomeView(grades: .constant([
            Grade(number: 1, percentageCorrect: 80, words: [
                Word(title:"a tempo", definition: "resuming the speed obtained preceding ritardando or accelerando."),
                Word(title:"accelerando", altText: "accel.", definition: "gradually increasing in speed"),
                Word(title:"adagio", definition: "in a leisurely manner; slowly"),
                Word(title:"allegretto", definition: "in a leisurely manner; slowly"),
                Word(title:"allegro", definition: "brisk or rapid in tempo"),
                Word(title:"andante", definition: "moderately slow and even"),
                Word(title:"cantabile", definition: "songlike and flowing in style"),
                Word(title:"crescendo", altText: "cresc.", definition: "force"),
                Word(title:"da capo", altText: "D.C.", definition: "beginning"),
                Word(title:"decrescendo", altText: "decresc.", definition: "gradually reducing force or loudness; diminuendo "),
                Word(title:"diminuendo", altText: "dimin. / dim.", definition: "gradually reducing in force or loudness; decrescendo"),
                Word(title:"dolce", definition: "sweet; soft"),
                Word(title:"forte", altText: "f", definition: "to play loudly"),
                Word(title:"fortissimo", altText: "ff", definition: "to play loudly (louder than forte"),
                Word(title:"fine, al fine", definition: "to repeat sections of a composition either from the beginning (D.C), or the dal segno sign, until the \"Fine\" symbol"),
                Word(title:"legato", definition: "a smooth, graceful style"),
                Word(title:"mezzo forte", altText: "mf", definition: "softer than forte"),
                Word(title:"moderato", definition: "in a moderate tempo"),
                Word(title:"mezzo piano", altText: "mf", definition: "slightly softer than mezzo forte"),
                Word(title:"piano", altText: "p", definition: "quietly /   softly"),
                Word(title:"pianissimo", altText: "pp", definition: "very softly, even more softly than piano"),
                Word(title:"rallentando", altText: "rall.", definition: "a gradual slowing of the tempo"),
                Word(title:"ritardando", altText: "ritard. / rit.", definition: "a gradual slowing of the tempo, or a delay"),
                Word(title:"staccato", altText: "stacc.", definition: "to play in a detached, seperate manner ")]),
            Grade(number: 2, percentageCorrect: 80),
            Grade(number: 3, percentageCorrect: 80),
            Grade(number: 4, percentageCorrect: 80),
            Grade(number: 5, percentageCorrect: 80)]))
    }
}
