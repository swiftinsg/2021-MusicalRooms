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

            Text("Musical terms")
                .font(.system(size: 24, weight: .semibold))
                .padding(.top, 20)
            Text("Click to open as flashcards")
                .font(.system(size: 12, weight: .medium))

            List {
                ForEach(0 ..< (words.count), id:\.self) { word in
                    NavigationLink {
                        FlashcardsView(words: words, currentWord: word)
                    } label: {
                        VStack {
                            Text(words[word].title)
                                    .foregroundColor(Color("fg"))
                                    .font(.system(size: 25, design: .rounded))
                                    .fontWeight(.semibold)

                            if let altText = words[word].altText {
                                Text(altText)
                                        .foregroundColor(Color("fg"))
                                        .font(.system(size: 20, design: .rounded))
                                        .fontWeight(.medium)
                                        .multilineTextAlignment(.leading)
                                }
                            }
                            .frame(width: 250, height: 45, alignment: .leading)
                        }
                        .listRowBackground(Color("secondary"))
                    }
            }
            .scaledToFill()
            .padding(.vertical, 0)
            .cornerRadius(5)
            .listStyle(.plain)
            .onAppear{
                UITableView.appearance().backgroundColor = .clear
            }
            
            NavigationLink {
                QuestionView(grades: $grades, grade: grade, words: words)
            } label: {
                Text("Start Quiz")
                    .foregroundColor(Color("secondary"))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 24))
                    .padding()
            }
            .padding(.horizontal)
            .background(Color("primary"))
            .cornerRadius(10)
            .navigationTitle("Grade \(grade)")

        }
        .offset(y:-15)
            .padding(20)
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView(grades: .constant([Grade(number: 1, percentageCorrect: 0)]), grade: 1)
    }
}
