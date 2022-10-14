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
    
    @State var correctAnswer = 0
    @State var correctAnswerWords: [Bool] = []
    @State var currentQuestion = 0
    @State var score: Double = 0
    
    @State var isContinueButtonHidden = true
    @State var isDisabled = false
    
    @State var randomIndexes = Array(repeating: 0, count: 4)
    @State var rectangleColours = Array(repeating: Color("darkBrown"), count: 4)
    @State var foregroundColours = Array(repeating: Color.white, count: 4)
    
    @State var pastelGreen = Color.init(red: 0.3764705882, green: 0.8392156863, blue: 0.462745098)
    @State var pastelRed = Color.init(red: 0.8392156863, green: 0.4, blue: 0.3764705882)
    
    var body: some View {
        ScrollView{
            VStack {
                
                ZStack(alignment: .top) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 180, alignment: .center)
                        .foregroundColor(Color("lightBrown"))
                    
                    VStack(spacing: 0) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 50, alignment: .leading)
                                .foregroundColor(Color("darkBrown"))
                            
                            Text("\(currentQuestion + 1)/\(words.count)")
                                .font(.system(size: 22, design: .rounded))
                                .foregroundColor(Color("evenLighterBrown"))
                                .bold()
                        }
                        VStack {
                            Text(words[currentQuestion].title)
                                .bold()
                                .font(.system(size: 28, design: .rounded))
                            if let alt = words[currentQuestion].altText {
                                Text(alt)
                                    .font(.system(size: 28, design: .rounded))
                            }
                        }
                        .frame(maxHeight: .infinity, alignment: .center)
                    }
                }
                .padding(.bottom, 60)
                .frame(height: 140, alignment: .center)
                Spacer().frame(height:20)
                
                
                ForEach(0..<4){button in
                    Button{
                        evaluateAnswer(button)
                    } label: {
                        Text(correctAnswer==button ? words[currentQuestion].definition  :  words[randomIndexes[button]].definition)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(foregroundColours[button])
                            .font(.system(size: 20, design: .rounded))
                            .padding(5)
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(rectangleColours[button])
                    .cornerRadius(10)
                    .disabled(isDisabled)
                    
                }
                
                if !isContinueButtonHidden {
                    if currentQuestion < words.count - 1 {
                        Spacer().frame(height: 15)
                        Button {
                            isContinueButtonHidden = true
                            foregroundColours = Array(repeating: Color.white, count: 4)
                            rectangleColours = Array(repeating: Color("darkBrown"), count: 4)

                            currentQuestion += 1
                            isDisabled = false
                            
                            correctAnswer = Int.random(in: 0 ..< 4)
                            randomIndexes = Array(Set(0..<words.count)).prefix(4).shuffled()
                            print(words)
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
                            ActualResultsView(grades: $grades, questionAnswers: correctAnswerWords, percentCorrect: score/Double(words.count)*100, grade: grade)
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
                randomIndexes = Array(Set(0..<words.count)).prefix(4).shuffled()
                correctAnswer = Int.random(in: 0 ..< 4)
                correctAnswerWords = Array(repeating: false, count: words.count)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    
    //funcs
    fileprivate func evaluateAnswer(_ button: Int) {
        withAnimation(.easeInOut(duration: 0.1)){
            isContinueButtonHidden = false
            isDisabled = true

            if(button==correctAnswer){
                correctAnswerWords[currentQuestion] = true
                score += 1
                rectangleColours[button] = Color("lightGreen")
                foregroundColours[button] = Color("darkerBrown")
            }else{
                rectangleColours[button] = Color("lightRed")
                foregroundColours[button] = .white
                rectangleColours[correctAnswer] = Color("lightGreen")
                foregroundColours[correctAnswer] = Color("darkerBrown")
            }
        }
    }
}


struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(grades: .constant([Grade(number: 1, percentageCorrect: 0)]), grade: 1, words: [Word(title: "placeholder", definition: "hi")])
    }
}
