//
//  TheoryHomeView.swift
//  MusicalRooms
//
//  Created by sap on 15/11/21.
//

import SwiftUI

struct TheoryHomeView: View {
    
    @State var grades = [
        Grade(number: 1, percentageCorrect: 80, words: [
            Word(title:"a tempo"),
            Word(title:"accelerando", altText: "accel."),
            Word(title:"adagio"),
            Word(title:"allegretto"),
            Word(title:"allegro"),
            Word(title:"andante"),
            Word(title:"cantabile"),
            Word(title:"crescendo", altText: "cresc."),
            Word(title:"da capo", altText: "D.C."),
            Word(title:"decrescendo", altText: "decresc."),
            Word(title:"diminuendo", altText: "dimin. / dim."),
            Word(title:"dolce"),
            Word(title:"forte", altText: "f"),
            Word(title:"fortissimo", altText: "ff"),
            Word(title:"fine, al fine"),
            Word(title:"legato"),
            Word(title:"mezzo forte", altText: "mf"),
            Word(title:"moderato"),
            Word(title:"mezzo piano", altText: "mf"),
            Word(title:"piano", altText: "p"),
            Word(title:"pianissimo", altText: "pp"),
            Word(title:"rallentando", altText: "rall."),
            Word(title:"ritardando", altText: "ritard. / rit."),
            Word(title:"staccato", altText: "stacc.")]),
        Grade(number: 2, percentageCorrect: 80),
        Grade(number: 3, percentageCorrect: 80),
        Grade(number: 4, percentageCorrect: 80),
        Grade(number: 5, percentageCorrect: 80)]
    
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
        TheoryHomeView()
    }
}
