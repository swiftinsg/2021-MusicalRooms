//
//  DefinitionModalView.swift
//  MusicalRooms
//
//  Created by Isaac Lee Jing Zhi on 21/11/21.
//

import SwiftUI

struct DefinitionModalView: View {
    
    var words: [Word]
    var currentWord: Int
    
    @State var isFlipped = false
    @State var moveOnToNextWord = false
    @State var degrees: Angle = Angle(degrees: 0)
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 350, height: 300, alignment: .center)
                    .foregroundColor(Color("lightBrown"))
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 350, height: 50, alignment: .leading)
                    .foregroundColor(Color("darkBrown"))
                    .overlay(
                        Text("\(currentWord) / \(words.count)")
                            .font(.system(size: 19, design: .rounded))
                            .foregroundColor(Color("darkerBrown"))
                            .bold()
                            .offset(x: -120)
                    )
                    .offset(y: -125)
                
                VStack {
                    Text(words[currentWord].title)
                        .bold()
                        .font(.system(size: 30, design: .rounded))
                    if let altText = words[currentWord].altText {
                        Text(altText)
                            .font(.system(size: 20, design: .rounded))
                    } else {
                        Text("---")
                            .font(.system(size: 20, design: .rounded))
                    }
                }
            }
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 350, height: 90)
                .foregroundColor(Color("lightBrown"))
                .overlay(
                    HStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "chevron.left.2")
                                .foregroundColor(Color("darkerBrown"))
                                .font(.system(size: 30))
                        }
                        .offset(x: -60)
                        
                        Rectangle()
                            .frame(width: 2)
                            .foregroundColor(Color("darkBrown"))
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "chevron.right.2")
                                .foregroundColor(Color("darkerBrown"))
                                .font(.system(size: 30))
                        }
                        .offset(x: 60)
                    }
                )
                .offset(y: 30)
        }
    }
}

struct DefinitionModalView_Previews: PreviewProvider {
    static var previews: some View {
        DefinitionModalView(words: [
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
            Word(title:"staccato", altText: "stacc.", definition: "to play in a detached, seperate manner ")], currentWord: 0)
    }
}
