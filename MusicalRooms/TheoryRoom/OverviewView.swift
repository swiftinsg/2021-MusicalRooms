//
//  OverviewView.swift
//  MusicalRooms
//
//  Created by Chelsea Ling on 18/11/21.
//

import SwiftUI

struct OverviewView: View {
    
    @Binding var words: [Word]
    @State var expandAll = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    if expandAll {
                        ForEach(0 ..< words.count) { word in
                            NavigationLink {
                                DefinitionModalView(words: words, currentWord: word)
                            } label: {
                                VStack {
                                    Text(words[word].title)
                                        .foregroundColor(Color("darkerBrown"))
                                        .font(.system(size: 25, design: .rounded))
                                        .fontWeight(.semibold)
                                    
                                    if let altText = words[word].altText {
                                        Text(altText)
                                            .foregroundColor(Color("darkerBrown"))
                                            .font(.system(size: 20, design: .rounded))
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.leading)
                                    } else {
                                        Text("---")
                                            .foregroundColor(Color("darkerBrown"))
                                            .font(.system(size: 20, design: .rounded))
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.leading)
                                    }
                                }
                                .frame(width: 150, height: 42, alignment: .leading)
                            }
                            .listRowBackground(Color("lightBrown"))
                        }
                    } else {
                        ForEach(0 ..< 5) {
                            word in NavigationLink {
                                
                            } label: {
                                VStack {
                                    Text(words[word].title)
                                        .foregroundColor(Color("darkerBrown"))
                                        .font(.system(size: 25, design: .rounded))
                                        .fontWeight(.semibold)
                                    
                                    if let altText = words[word].altText {
                                        Text(altText)
                                            .foregroundColor(Color("darkerBrown"))
                                            .font(.system(size: 20, design: .rounded))
                                            .fontWeight(.medium)
                                    } else {
                                        Text("---")
                                            .foregroundColor(Color("darkerBrown"))
                                            .font(.system(size: 20, design: .rounded))
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.leading)
                                    }
                                }
                                .frame(width: 150, height: 42, alignment: .leading)
                            }
                            .listRowBackground(Color("lightBrown"))
                        }
                    }
                }
                .frame(width: 400, height: 500, alignment: .center
                )
                .offset(y: -160)
                
                Button {
                    expandAll.toggle()
                } label: {
                    HStack {
                        Image(systemName: !expandAll ? "chevron.down" : "chevron.up")
                        Text("Expand All")
                            .fontWeight(.heavy)
                    }
                    .frame(width: 150, height: 80, alignment: .center)
                    .font(.system(size: 19, design: .rounded))
                    .foregroundColor(Color(expandAll ? "lightBrown" : "darkBrown"))
                    .background(Color(expandAll ? "darkBrown" : "lightBrown"))
                    .cornerRadius(20)
                }
                .offset(y: -120)
                
                Button {
                    
                } label: {
                    Text("Start")
                        .foregroundColor(Color.white)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 30, design: .rounded))
                }
                .padding()
                .frame(width:350, height: 50, alignment: .center)
                .background( Color("darkBrown"))
                .cornerRadius(10)
                .navigationTitle("Grade 1") //to do: link this to TheoryHomeView
                
            }
            
        }
        
    }
}
struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView(words: .constant(
            [
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
                Word(title:"staccato", altText: "stacc.", definition: "to play in a detached, seperate manner ")]))
    }
}
