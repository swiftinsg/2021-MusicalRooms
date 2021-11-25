//
//  QuestionView.swift
//  MusicalRooms
//
//  Created by Isaac Lee Jing Zhi on 24/11/21.
//

import SwiftUI

struct QuestionView: View {
    
    @Binding var grades: [Grade]
    var grade: Int
    
    var words: [Word]
    @State var shuffledWords: [Word] = [Word(title: "placeholder", definition: "hi")]
    
    @State var correctAnswer = 0
    @State var correctAnswerWords: [Int] = []
    @State var currentQuestion = 0
    @State var score: Double = 0

    @State var isContinueButtonHidden = true
    @State var isDisabled = false
    
    @State var randomIndex1 = 0
    @State var randomIndex2 = 0
    @State var randomIndex3 = 0
    @State var randomIndex4 = 0
    
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
        questionAnswers[currentQuestion] = true
        score += 1
        correctAnswerWords.append(shuffledWords[currentQuestion])
        if button == 1 {
            rectangleColor1 = Color("lightGreen")
            foregroundColor1 = Color("darkerBrown")
        } else if button == 2 {
            rectangleColor2 = Color("lightGreen")
            foregroundColor2 = Color("darkerBrown")
        } else if button == 3 {
            rectangleColor3 = Color("lightGreen")
            foregroundColor3 = Color("darkerBrown")
        } else if button == 4 {
            rectangleColor4 = Color("lightGreen")
            foregroundColor4 = Color("darkerBrown")
        }
    } else {
        if button == 1 {
            rectangleColor1 = Color("lightRed")
            foregroundColor1 = .white
            if correctAnswer == 2 {
                rectangleColor2 = Color("lightGreen")
                foregroundColor2 = Color("darkerBrown")
            } else if correctAnswer == 3 {
                rectangleColor3 = Color("lightGreen")
                foregroundColor3 = Color("darkerBrown")
            } else if correctAnswer == 4 {
                rectangleColor4 = Color("lightGreen")
                foregroundColor4 = Color("darkerBrown")
            }
        } else if button == 2 {
            rectangleColor2 = Color("lightRed")
            foregroundColor2 = .white
            if correctAnswer == 1 {
                rectangleColor1 = Color("lightGreen")
                foregroundColor1 = Color("darkerBrown")
            } else if correctAnswer == 3 {
                rectangleColor3 = Color("lightGreen")
                foregroundColor3 = Color("darkerBrown")
            } else if correctAnswer == 4 {
                rectangleColor4 = Color("lightGreen")
                foregroundColor4 = Color("darkerBrown")
            }
        } else if button == 3 {
            rectangleColor3 = Color("lightRed")
            foregroundColor3 = .white
            if correctAnswer == 1 {
                rectangleColor1 = Color("lightGreen")
                foregroundColor1 = Color("darkerBrown")
            } else if correctAnswer == 2 {
                rectangleColor2 = Color("lightGreen")
                foregroundColor2 = Color("darkerBrown")
            } else if correctAnswer == 4 {
                rectangleColor4 = Color("lightGreen")
                foregroundColor4 = Color("darkerBrown")
            }
        } else if button == 4 {
            rectangleColor4 = Color("lightRed")
            foregroundColor4 = .white
            if correctAnswer == 1 {
                rectangleColor1 = Color("lightGreen")
                foregroundColor1 = Color("darkerBrown")
            } else if correctAnswer == 2 {
                rectangleColor2 = Color("lightGreen")
                foregroundColor2 = Color("darkerBrown")
            } else if correctAnswer == 3 {
                rectangleColor3 = Color("lightGreen")
                foregroundColor3 = Color("darkerBrown")
            }
        }
    }
    print(correctAnswer, button)
}
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 350, height: 250, alignment: .center)
                    .foregroundColor(Color("lightBrown"))


                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 350, height: 50, alignment: .leading)
                    .foregroundColor(Color("darkBrown"))
                    .overlay(
                        HStack {
                            Text("\(currentQuestion + 1)/\(shuffledWords.count)")
                                .font(.system(size: 22, design: .rounded))
                                .foregroundColor(Color("evenLighterBrown"))
                                .bold()
                                .offset(x: -130)
                        }
                    )
                    .offset(y: -115)

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
                        .frame(width: 330, height: 80, alignment: .center)
                        .overlay (
                            VStack {
                                if correctAnswer == 1 {
                                    Text(shuffledWords[currentQuestion].definition)
                                        .foregroundColor(foregroundColor1)
                                        .font(.system(size: 20, design: .rounded))
                                        .fontWeight(.bold)
                                } else {
                                    Text(shuffledWords[randomIndex1].definition)
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
                        .frame(width: 330, height: 80, alignment: .center)
                        .overlay (
                            VStack {
                                if correctAnswer == 2 {
                                    Text(shuffledWords[currentQuestion].definition)
                                        .foregroundColor(foregroundColor2)
                                        .font(.system(size: 20, design: .rounded))
                                        .fontWeight(.bold)
                                } else {
                                    Text(shuffledWords[randomIndex2].definition)
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
                        .frame(width: 330, height: 80, alignment: .center)
                        .cornerRadius(20)
                        .overlay(
                            VStack {
                                if correctAnswer == 3 {
                                    Text(shuffledWords[currentQuestion].definition)
                                        .foregroundColor(foregroundColor3)
                                        .font(.system(size: 20, design: .rounded))
                                        .fontWeight(.bold)
                                } else {
                                    Text(shuffledWords[randomIndex3].definition)
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
                        .frame(width: 330, height: 80, alignment: .center)
                        .cornerRadius(20)
                        .overlay(
                            VStack {
                                if correctAnswer == 4 {
                                    Text(shuffledWords[currentQuestion].definition)
                                        .foregroundColor(foregroundColor4)
                                        .font(.system(size: 20, design: .rounded))
                                        .fontWeight(.bold)
                                } else {
                                    Text(shuffledWords[randomIndex4].definition)
                                        .foregroundColor(foregroundColor4)
                                        .font(.system(size: 20, design: .rounded))
                                        .fontWeight(.bold)
                                }
                            }
                        )
                }
                .disabled(isDisabled)
            }

            if !isContinueButtonHidden {
                if currentQuestion < shuffledWords.count - 1 {
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
                        
                        randomIndex1 = Int.random(in: 0 ..< 5)
                        randomIndex2 = Int.random(in: 5 ..< 10)
                        randomIndex3 = Int.random(in: 10 ..< 15)
                        randomIndex4 = Int.random(in: 15 ..< shuffledWords.count)
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 350, height: 50, alignment: .center)
                                .foregroundColor(Color("darkerBrown"))
                                .cornerRadius(20)

                            Text("Continue")
                                .foregroundColor(Color("evenLighterBrown"))
                                .bold()
                                .font(.system(size: 20, design: .rounded))
                        }
                    }
                } else {
                    NavigationLink {
                        ActualResultsView(grades: $grades, questionAnswers: <#[Bool]#>, percentCorrect: score/Double(shuffledWords.count)*100, grade: grade)
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 350, height: 50, alignment: .center)
                                .foregroundColor(Color("darkBrown"))
                                .cornerRadius(20)

                            Text("End")
                                .foregroundColor(Color("lightBrown"))
                                .bold()
                                .font(.system(size: 20, design: .rounded))
                        }
                    }
                }
            }
        }
        .offset(y: -30)
        .padding()
        .onAppear {
            shuffledWords = words
            shuffledWords.shuffle()
            
            randomIndex1 = Int.random(in: 0 ..< 5)
            randomIndex2 = Int.random(in: 5 ..< 10)
            randomIndex3 = Int.random(in: 10 ..< 15)
            randomIndex4 = Int.random(in: 15 ..< shuffledWords.count)
            
            correctAnswer = Int.random(in: 1 ..< 5)
        }
    }
}


struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(grades: .constant([Grade(number: 1, percentageCorrect: 0)]), grade: 1, words: [Word(title: "placeholder", definition: "hi")])
    }
}
