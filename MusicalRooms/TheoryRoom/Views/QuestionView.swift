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
    @State var correctAnswerWords: [Bool] = []
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
    @State var foregroundColor1 = Color.white
    @State var foregroundColor2 = Color.white
    @State var foregroundColor3 = Color.white
    @State var foregroundColor4 = Color.white
    
    @State var pastelGreen = Color.init(red: 0.3764705882, green: 0.8392156863, blue: 0.462745098)
    @State var pastelRed = Color.init(red: 0.8392156863, green: 0.4, blue: 0.3764705882)
    
    fileprivate func wrongOrCorrectAction(_ button: Int, _ correctAnswer: Int) {
        isContinueButtonHidden = false
        isDisabled = true
        if button == correctAnswer {
            correctAnswerWords[words.firstIndex(of: shuffledWords[currentQuestion])!] = true
            score += 1
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
        print(correctAnswerWords)
    }
    
    var body: some View {
        ScrollView{
            VStack {
                ZStack(alignment: .top) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 140, alignment: .center)
                        .foregroundColor(Color("lightBrown"))
                    
                    VStack(spacing: 0) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 50, alignment: .leading)
                                .foregroundColor(Color("darkBrown"))
                            
                            Text("\(currentQuestion + 1)/\(shuffledWords.count)")
                                .font(.system(size: 22, design: .rounded))
                                .foregroundColor(Color("evenLighterBrown"))
                                .bold()
                        }
                        VStack {
                            Text(shuffledWords[currentQuestion].title)
                                .bold()
                                .font(.system(size: 28, design: .rounded))
                            if let alt = shuffledWords[currentQuestion].altText {
                                Text(alt)
                                    .font(.system(size: 28, design: .rounded))
                            }
                        }
                        .frame(maxHeight: .infinity, alignment: .center)
                    }
                }
                .frame(height: 140, alignment: .center)
                Spacer().frame(height:20)
                
                
                //---------- BUTTONS -----------
                VStack {
                    Button {
                        wrongOrCorrectAction(1, correctAnswer)
                    } label: {
                        VStack(alignment: .center) {
                            if correctAnswer == 1 {
                                Text(shuffledWords[currentQuestion].definition)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(foregroundColor1)
                                    .font(.system(size: 20, design: .rounded))
                                    .padding(5)
                                    .frame(maxWidth: .infinity)
                            } else {
                                Text(shuffledWords[randomIndex1].definition)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(foregroundColor1)
                                    .font(.system(size: 20, design: .rounded))
                                    .padding(5)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(rectangleColor1)
                        .cornerRadius(10)
                    }
                    .disabled(isDisabled)
                    
                    Button {
                        wrongOrCorrectAction(2, correctAnswer)
                    } label: {
                        VStack(alignment: .center) {
                            if correctAnswer == 2 {
                                Text(shuffledWords[currentQuestion].definition)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(foregroundColor2)
                                    .font(.system(size: 20, design: .rounded))
                                    .padding(5)
                                    .frame(maxWidth: .infinity)
                            } else {
                                Text(shuffledWords[randomIndex2].definition)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(foregroundColor2)
                                    .font(.system(size: 20, design: .rounded))
                                    .padding(5)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(rectangleColor2)
                        .cornerRadius(10)
                    }
                    .disabled(isDisabled)
                    
                    Button {
                        wrongOrCorrectAction(3, correctAnswer)
                    } label: {
                        VStack(alignment: .center) {
                            if correctAnswer == 3 {
                                Text(shuffledWords[currentQuestion].definition)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(foregroundColor3)
                                    .font(.system(size: 20, design: .rounded))
                                    .padding(5)
                                    .frame(maxWidth: .infinity)
                            } else {
                                Text(shuffledWords[randomIndex3].definition)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(foregroundColor3)
                                    .font(.system(size: 20, design: .rounded))
                                    .padding(5)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(rectangleColor3)
                        .cornerRadius(10)
                    }
                    .disabled(isDisabled)
                    
                    Button {
                        wrongOrCorrectAction(4, correctAnswer)
                    } label: {
                        VStack(alignment: .center) {
                            if correctAnswer == 4 {
                                Text(shuffledWords[currentQuestion].definition)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(foregroundColor4)
                                    .font(.system(size: 20, design: .rounded))
                                    .padding(5)
                                    .frame(maxWidth: .infinity)
                            } else {
                                Text(shuffledWords[randomIndex4].definition)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(foregroundColor4)
                                    .font(.system(size: 20, design: .rounded))
                                    .padding(5)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(rectangleColor4)
                        .cornerRadius(10)
                    }
                    .disabled(isDisabled)
                    //---------- END BUTTONS -----------
                    
                    
                }
                
                if !isContinueButtonHidden {
                    if currentQuestion < shuffledWords.count - 1 {
                        Button {
                            isContinueButtonHidden = true
                            foregroundColor1 = Color.white
                            foregroundColor2 = Color.white
                            foregroundColor3 = Color.white
                            foregroundColor4 = Color.white
                            
                            rectangleColor1 = Color("darkBrown")
                            rectangleColor2 = Color("darkBrown")
                            rectangleColor3 = Color("darkBrown")
                            rectangleColor4 = Color("darkBrown")
                            
                            currentQuestion += 1
                            isDisabled = false
                            
                            correctAnswer = Int.random(in: 1 ..< 5)
                            
                            let shuffledWords = Array(Set(0..<shuffledWords.count)).prefix(4).shuffled()
                            
                            randomIndex1 = shuffledWords[0]
                            randomIndex2 = shuffledWords[1]
                            randomIndex3 = shuffledWords[2]
                            randomIndex4 = shuffledWords[3]
                            
                            print(shuffledWords)
                        } label: {
                            Text("Continue")
                                .foregroundColor(Color("evenLighterBrown"))
                                .bold()
                                .font(.system(size: 18, design: .rounded))
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color("darkerBrown"))
                                .cornerRadius(20)
                        }
                    } else {
                        NavigationLink {
                            ActualResultsView(grades: $grades, questionAnswers: correctAnswerWords, percentCorrect: score/Double(shuffledWords.count)*100, grade: grade)
                        } label: {
                            Text("Continue")
                                .foregroundColor(Color("lightBrown"))
                                .bold()
                                .font(.system(size: 18, design: .rounded))
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color("darkBrown"))
                                .cornerRadius(20)
                        }
                    }
                }
            }
            .padding()
            .onAppear {
                shuffledWords = words.shuffled()
                let shuffledWordIndices = Array(Set(0..<shuffledWords.count)).prefix(4).shuffled()
                
                randomIndex1 = shuffledWordIndices[0]
                randomIndex2 = shuffledWordIndices[1]
                randomIndex3 = shuffledWordIndices[2]
                randomIndex4 = shuffledWordIndices[3]
                
                correctAnswer = Int.random(in: 1 ..< 5)
                
                correctAnswerWords = Array(repeating: false, count: words.count)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(grades: .constant([Grade(number: 1, percentageCorrect: 0)]), grade: 1, words: [Word(title: "placeholder", definition: "hi")])
    }
}
