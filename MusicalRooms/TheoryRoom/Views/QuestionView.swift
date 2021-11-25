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
    @State var currentQuestion = 0
    @State var score: Double = 0

    @State var questionAnswers = [Bool]()
    
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
    @State var foregroundColor1 = Color("evenLighterBrown")
    @State var foregroundColor2 = Color("evenLighterBrown")
    @State var foregroundColor3 = Color("evenLighterBrown")
    @State var foregroundColor4 = Color("evenLighterBrown")
    
    @State var pastelGreen = Color.init(red: 0.3764705882, green: 0.8392156863, blue: 0.462745098)
    @State var pastelRed = Color.init(red: 0.8392156863, green: 0.4, blue: 0.3764705882)
    
    fileprivate func wrongOrCorrectAction(_ button: Int, _ correctAnswer: Int) {
        isContinueButtonHidden = false
        isDisabled = true
        withAnimation(.easeInOut(duration: 0.5)){
            if button == correctAnswer {
                questionAnswers[currentQuestion] = true
                score += 1
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
                    rectangleColor4 = pastelRed
                    foregroundColor4 = .black
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
    print(correctAnswer, button)
    }
    
    var body: some View {
        VStack {

            //Question
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                        .frame(height: 180, alignment: .center)
                        .foregroundColor(Color("lightBrown"))

                RoundedRectangle(cornerRadius: 10)
                        .frame(height: 50, alignment: .leading)
                        .foregroundColor(Color("darkBrown"))
                        .overlay(
                                HStack {
                                    Text("\(currentQuestion + 1)/\(shuffledWords.count)")
                                            .font(.system(size: 19, design: .rounded))
                                            .foregroundColor(Color("lightBrown"))
                                            .bold()
                                            .offset(x: -130)
                                }
                        )
                        .offset(y: -100)

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
            .padding(.leading, 20)
            .padding(.trailing, 20)

            Spacer().frame(height:60)

            VStack (spacing: 5){

                ForEach(1..<5) { button in
                    Button {
                        wrongOrCorrectAction(button, correctAnswer)
                    } label: {
                        Rectangle()
                                .foregroundColor(getRectangleColour(index: button))
                                .cornerRadius(15)
                                .frame(height: 60, alignment: .center)
                                .overlay(
                                    VStack {
                                        if correctAnswer != button-1 {
                                            Text(shuffledWords[currentQuestion].definition)
                                                    .foregroundColor(getForegroundColour(index: button))
                                                    .font(.system(size: 20, design: .rounded))
                                                    .fontWeight(.bold)
                                        } else {
                                            Text(shuffledWords[getRandomIndex(index: button)].definition)
                                                    .foregroundColor(getForegroundColour(index: button))
                                                    .font(.system(size: 20, design: .rounded))
                                                    .fontWeight(.bold)
                                        }
                                    }
                                )
                    }.disabled(isDisabled)
                }


                if !isContinueButtonHidden {
                    if currentQuestion < shuffledWords.count - 1 {
                        Button {
                            print(score)
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

                            correctAnswer = Int.random(in: 1..<5)

                            randomIndex1 = Int.random(in: 0..<shuffledWords.count * 1 / 4)
                            randomIndex2 = Int.random(in: shuffledWords.count * 1 / 4..<shuffledWords.count * 2 / 4)
                            randomIndex3 = Int.random(in: shuffledWords.count * 2 / 4..<shuffledWords.count * 3 / 4)
                            randomIndex4 = Int.random(in: shuffledWords.count * 3 / 4..<shuffledWords.count)

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
                    } else {
                        NavigationLink {
                            ActualResultsView(grades: $grades, questionAnswers: questionAnswers, percentCorrect: score / Double(shuffledWords.count) * 100, grade: grade)
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
                }else{
                    Spacer().frame(height:55)
                }
            }
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .offset(y: -30)
                    .onAppear {
                        shuffledWords = words
                        shuffledWords.shuffle()

                        //Assign randomIndex1-4 to random unique indexes in shuffledWords

                        if shuffledWords.count < 4 {
                            print("TheoryRoom - grade word list invalid")
                            return
                        }

                        var shuffledIndexes = Array(0..<shuffledWords.count+1).shuffled()
                        print("Test: \(shuffledIndexes)")

                        correctAnswer = Int.random(in: 1..<5)
                    }
        }
        .onAppear {
            questionAnswers = [Bool](repeating: false, count: words.count)
        }
    }

    //funcs
    func getRectangleColour(index: Int) -> Color {
        switch index{
        case 1: return rectangleColor1
        case 2: return rectangleColor2
        case 3: return rectangleColor3
        case 4: return rectangleColor4
        default: return Color("darkBrown")
        }
    }
    func getForegroundColour(index: Int) -> Color {
        switch index{
        case 1: return foregroundColor1
        case 2: return foregroundColor2
        case 3: return foregroundColor3
        case 4: return foregroundColor4
        default: return Color("lightBrown")
        }
    }
    func getRandomIndex(index: Int) -> Int {
        switch index{
        case 1: return randomIndex1
        case 2: return randomIndex2
        case 3: return randomIndex3
        case 4: return randomIndex4
        default: return 0
        }
    }
}


struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(grades: .constant([Grade(number: 1, percentageCorrect: 0)]), grade: 1, words: [Word(title: "placeholder", definition: "hi")])
    }
}
