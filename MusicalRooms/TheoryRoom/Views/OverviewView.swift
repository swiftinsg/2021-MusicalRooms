//
//  OverviewView.swift
//  MusicalRooms
//
//  Created by Chelsea Ling on 18/11/21.
//
import SwiftUI

struct OverviewView: View {
    
    @Binding var grades: [Grade]
    var grade: Int
    var words: [Word] {
        getWords(grade)
    }
    
    var body: some View {
        VStack {
            Spacer().frame(height:30)

            Text("Musical terms")
                .font(Font.system(size: 24, weight: .semibold))
                .padding(.top, 20)
            Text("Click to open as flashcards")
                .font(Font.system(size: 12, weight: .medium))

            List {
                ForEach(0 ..< (words.count), id:\.self) { word in
                    NavigationLink {
                        FlashcardsView(words: words, currentWord: word)
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
                                }
                            }
                            .frame(width: 250, height: 45, alignment: .leading)
                        }
                        .listRowBackground(Color("lightBrown"))
                    }
            }
            .padding(.horizontal, 20)
            .cornerRadius(15)
            .listStyle(.automatic)
            .onAppear{
                UITableView.appearance().backgroundColor = .clear
            }
            Spacer().frame(height:30)
            
            NavigationLink {
                QuestionView(grades: $grades, grade: grade, words: words)
            } label: {
                Text("Start Quiz")
                    .foregroundColor(Color("evenLighterBrown"))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 30, design: .rounded))
            }
            .padding(.horizontal, 10)
            .frame(width: 300, height: 60, alignment: .center)
            .background(Color("darkBrown"))
            .cornerRadius(10)
            .navigationTitle("Grade \(grade)")

        }.offset(y:-40)
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView(grades: .constant([Grade(number: 1, percentageCorrect: 0)]), grade: 1)
    }
}
