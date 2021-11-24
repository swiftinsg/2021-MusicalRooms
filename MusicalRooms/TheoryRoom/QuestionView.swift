//
//  QuestionView.swift
//  MusicalRooms
//
//  Created by Isaac Lee Jing Zhi on 24/11/21.
//

import SwiftUI

struct QuestionView: View {
    
    var words: [Word]
    
    @State var correctAnswer = 0
    @State var currentQuestion = 0
    @State var score: Double = 0
    @State var isContinueButtonHidden = true
    
    @State var randomElement = 0
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 350, height: 300, alignment: .center)
                    .foregroundColor(Color("lightBrown"))
                
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 350, height: 50, alignment: .leading)
                    .foregroundColor(Color("darkBrown"))
                    .offset(y: -125)
                    .overlay(
                        HStack {
                            Text("\(currentQuestion + 1)/\(words.count)")
                                .font(.system(size: 19, design: .rounded))
                                .foregroundColor(Color("darkerBrown"))
                                .bold()
                                .offset(x: -120)
                        }
                            .offset(y: -125)
                    )
                VStack {
                    Text(words[randomElement].title)
                        .bold()
                        .font(.system(size: 30, design: .rounded))
                    if let alt = words[randomElement].altText {
                     Text(alt)
                            .font(.system(size: 20, design: .rounded))
                    } else {
                        Text("---")
                            .font(.system(size: 20, design: .rounded))
                    }
                }
            }
            
            VStack {
                Button {
                    
                } label: {
                    Rectangle()
                        .frame(width: 350, height: 80, alignment: .center)
                        .cornerRadius(20)
                        .foregroundColor(Color("darkBrown"))
                        .overlay {
                            if correctAnswer == 1 {
                               Text(words[randomElement].definition)
                            } else {
                                Text(words.randomElement()!.definition)
                            }
                        }
                }
                
                Button {
                    
                } label: {
                    Rectangle()
                        .frame(width: 350, height: 80, alignment: .center)
                        .cornerRadius(20)
                        .foregroundColor(Color("darkBrown"))
                        .overlay {
                            if correctAnswer == 2 {
                               Text(words[randomElement].definition)
                            } else {
                                Text(words.randomElement()!.definition)
                            }
                        }
                }
                
                Button {
                    
                } label: {
                    Rectangle()
                        .frame(width: 350, height: 80, alignment: .center)
                        .cornerRadius(20)
                        .foregroundColor(Color("darkBrown"))
                        .overlay {
                            if correctAnswer == 3 {
                               Text(words[randomElement].definition)
                            } else {
                                Text(words.randomElement()!.definition)
                            }
                        }
                }
                
                Button {
                } label: {
                    Rectangle()
                        .frame(width: 350, height: 80, alignment: .center)
                        .cornerRadius(20)
                        .foregroundColor(Color("darkBrown"))
                        .overlay {
                            if correctAnswer == 4 {
                                Text(words[randomElement].definition)
                            } else {
                                Text(words.randomElement()!.definition)
                            }
                        }
                }
            }
            .padding()
        }
        .onAppear {
            randomElement = Int.random(in: 0 ..< words.count)
            correctAnswer = Int.random(in: 1 ..< 5)
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(words: [Word(title:"a tempo", definition: "resuming the speed obtained preceding ritardando or accelerando."),
                              Word(title:"accelerando", altText: "accel.", definition: "gradually increasing in speed"),
                              Word(title:"adagio", definition: "in a leisurely manner; slowly"),
                              Word(title:"allegretto", definition: "in a leisurely manner; slowly"),
                              Word(title:"allegro", definition: "brisk or rapid in tempo"),
                              Word(title:"andante", definition: "moderately slow and even"),
                              Word(title:"cantabile", definition: "songlike and flowing in style"),
                              Word(title:"crescendo", altText: "cresc.", definition: "force"),
                              Word(title:"da capo", altText: "D.C.", definition: "(from the) beginning"),
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
                              Word(title:"staccato", altText: "stacc.", definition: "to play in a detached, seperate manner ")])
    }
}
