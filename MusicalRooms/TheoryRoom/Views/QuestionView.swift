//
//  QuestionView.swift
//  MusicalRooms
//
//  Created by Isaac Lee Jing Zhi on 24/11/21.
//

import SwiftUI

struct QuestionView: View {
    
    var words: [Word]
    
    @State var shuffledWords: [Word] = []
    
    @State var correctAnswer = 0
    @State var currentQuestion = 0
    @State var score: Double = 0
    
    @State var isContinueButtonHidden = true
    @State var isDisabled = false
    
    @State var randomElement = 0
    
    @State var rectangleColor1 = Color("darkBrown")
    @State var rectangleColor2 = Color("darkBrown")
    @State var rectangleColor3 = Color("darkBrown")
    @State var rectangleColor4 = Color("darkBrown")
    @State var foregroundColor1 = Color("lightBrown")
    @State var foregroundColor2 = Color("lightBrown")
    @State var foregroundColor3 = Color("lightBrown")
    @State var foregroundColor4 = Color("lightBrown")
    
    @State var pastelGreen = Color.init(red: 0.3764705882, green: 0.8392156863, blue: 0.462745098)
    @State var pastelRed = Color.init(red: 0.8392156863, green: 0.4, blue: 0.3764705882)
    
    fileprivate func wrongOrCorrectAction(_ button: Int, _ correctAnswer: Int) {
        isContinueButtonHidden = false
        isDisabled = true
        if button == correctAnswer {
            if button == 1 {
                rectangleColor1 = pastelGreen
                foregroundColor1 = .black
            } else if button == 2 {
                rectangleColor2 = pastelGreen
                foregroundColor2 = .black
            } else if button == 3 {
                rectangleColor3 = pastelGreen
                foregroundColor3 = .black
            } else if button == 4 {
                rectangleColor4 = pastelGreen
                foregroundColor4 = .black
            }
        } else {
            if button == 1 {
                rectangleColor1 = pastelRed
                foregroundColor1 = .black
                if correctAnswer == 2 {
                    rectangleColor2 = pastelGreen
                    foregroundColor2 = .black
                } else if correctAnswer == 3 {
                    rectangleColor3 = pastelGreen
                    foregroundColor3 = .black
                } else if correctAnswer == 4 {
                    rectangleColor4 = pastelGreen
                    foregroundColor4 = .black
                }
            } else if button == 2 {
                rectangleColor2 = pastelRed
                foregroundColor2 = .black
                if correctAnswer == 1 {
                    rectangleColor1 = pastelGreen
                    foregroundColor1 = .black
                } else if correctAnswer == 3 {
                    rectangleColor3 = pastelGreen
                    foregroundColor3 = .black
                } else if correctAnswer == 4 {
                    rectangleColor4 = pastelGreen
                    foregroundColor4 = .black
                }
            } else if button == 3 {
                rectangleColor3 = pastelRed
                foregroundColor3 = .black
                if correctAnswer == 1 {
                    rectangleColor1 = pastelGreen
                    foregroundColor1 = .black
                } else if correctAnswer == 2 {
                    rectangleColor2 = pastelGreen
                    foregroundColor2 = .black
                } else if correctAnswer == 4 {
                    rectangleColor4 = pastelGreen
                    foregroundColor4 = .black
                }
            } else if button == 4 {
                rectangleColor1 = pastelRed
                foregroundColor1 = .black
                if correctAnswer == 1 {
                    rectangleColor1 = pastelGreen
                    foregroundColor1 = .black
                } else if correctAnswer == 2 {
                    rectangleColor2 = pastelGreen
                    foregroundColor2 = .black
                } else if correctAnswer == 3 {
                    rectangleColor3 = pastelGreen
                    foregroundColor3 = .black
                }
            }
        }
    }
    
    var body: some View {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 350, height: 250, alignment: .center)
                        .foregroundColor(Color("lightBrown"))
                    
                    
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 350, height: 50, alignment: .leading)
                        .foregroundColor(Color("darkBrown"))
                        .offset(y: -125)
                        .overlay(
                            HStack {
                                Text("\(currentQuestion + 1)/\(shuffledWords.count)")
                                    .font(.system(size: 19, design: .rounded))
                                    .foregroundColor(Color("darkerBrown"))
                                    .bold()
                                    .offset(x: -120)
                            }
                                .offset(y: -125)
                        )
                    VStack {
                        Text(shuffledWords[currentQuestion].title)
                            .bold()
                            .font(.system(size: 30, design: .rounded))
                        if let alt = shuffledWords[currentQuestion].altText {
                            Text(alt)
                                .font(.system(size: 20, design: .rounded))
                        }
                    }
                }
                
                VStack {
                    Button {
                        wrongOrCorrectAction(1, correctAnswer)
                    } label: {
                        Rectangle()
                            .foregroundColor(rectangleColor1)
                            .cornerRadius(20)
                            .frame(width: 350, height: 80, alignment: .center)
                            .overlay (
                                VStack {
                                    if correctAnswer == 1 {
                                        Text(shuffledWords[currentQuestion].definition)
                                            .foregroundColor(foregroundColor1)
                                            .font(.system(size: 20, design: .rounded))
                                            .fontWeight(.bold)
                                    } else {
                                        Text(shuffledWords.randomElement()!.definition)
                                            .foregroundColor(foregroundColor1)
                                            .font(.system(size: 20, design: .rounded))
                                            .fontWeight(.bold)
                                    }
                                }
                            )
                    }
                    .disabled(isDisabled)
                    
                    Button {
                        wrongOrCorrectAction(2, correctAnswer)
                    } label: {
                        Rectangle()
                            .foregroundColor(rectangleColor2)
                            .cornerRadius(20)
                            .frame(width: 350, height: 80, alignment: .center)
                            .overlay (
                                VStack {
                                    if correctAnswer == 2 {
                                        Text(shuffledWords[currentQuestion].definition)
                                            .foregroundColor(foregroundColor2)
                                            .font(.system(size: 20, design: .rounded))
                                            .fontWeight(.bold)
                                    } else {
                                        Text(shuffledWords.randomElement()!.definition)
                                            .foregroundColor(foregroundColor2)
                                            .font(.system(size: 20, design: .rounded))
                                            .fontWeight(.bold)
                                    }
                                }
                            )
                    }
                    .disabled(isDisabled)
                    
                    Button {
                        wrongOrCorrectAction(3, correctAnswer)
                    } label: {
                        Rectangle()
                            .foregroundColor(rectangleColor3)
                            .frame(width: 350, height: 80, alignment: .center)
                            .cornerRadius(20)
                            .overlay (
                                VStack {
                                    if correctAnswer == 3 {
                                        Text(shuffledWords[currentQuestion].definition)
                                            .foregroundColor(foregroundColor3)
                                            .font(.system(size: 20, design: .rounded))
                                            .fontWeight(.bold)
                                    } else {
                                        Text(shuffledWords.randomElement()!.definition)
                                            .foregroundColor(foregroundColor3)
                                            .font(.system(size: 20, design: .rounded))
                                            .fontWeight(.bold)
                                    }
                                }
                            )
                    }
                    .disabled(isDisabled)
                    
                    Button {
                        wrongOrCorrectAction(4, correctAnswer)
                    } label: {
                        Rectangle()
                            .foregroundColor(rectangleColor4)
                            .cornerRadius(20)
                            .frame(width: 350, height: 85, alignment: .center)
                            .overlay (
                                VStack {
                                    if correctAnswer == 4 {
                                        Text(shuffledWords[currentQuestion].definition)
                                            .foregroundColor(foregroundColor4)
                                            .font(.system(size: 20, design: .rounded))
                                            .fontWeight(.bold)
                                    } else {
                                        Text(shuffledWords.randomElement()!.definition)
                                            .foregroundColor(foregroundColor4)
                                            .font(.system(size: 20, design: .rounded))
                                            .fontWeight(.bold)
                                    }
                                }
                            )
                    }
                    .disabled(isDisabled)
                    if !isContinueButtonHidden {
                        Button {
                            isContinueButtonHidden = true
                            foregroundColor1 = Color("lightBrown")
                            foregroundColor2 = Color("lightBrown")
                            foregroundColor3 = Color("lightBrown")
                            foregroundColor4 = Color("lightBrown")
                            
                            rectangleColor1 = Color("darkBrown")
                            rectangleColor2 = Color("darkBrown")
                            rectangleColor3 = Color("darkBrown")
                            rectangleColor4 = Color("darkBrown")
                            
                            currentQuestion += 1
                            isDisabled = false
                            
                            correctAnswer = Int.random(in: 1 ..< 5)
                            
                        } label: {
                            ZStack {
                                Rectangle()
                                    .frame(width: 350, height: 50, alignment: .center)
                                    .foregroundColor(Color("darkBrown"))
                                    .cornerRadius(20)
                                
                                Text("Continue")
                                    .foregroundColor(Color("lightBrown"))
                                    .bold()
                                    .font(.system(size: 20, design: .rounded))
                            }
                        }
                    }
                }
                .padding()
            }
            .onAppear {
                shuffledWords = words
                shuffledWords.shuffle()
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
