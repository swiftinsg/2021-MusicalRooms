//
//  ActualResultsView.swift
//  MusicalRooms
//
//  Created by Chelsea Ling on 24/11/21.
//

import SwiftUI

struct ActualResultsView: View {
    
    @State var pastelGreen = Color.init(red: 0.3764705882, green: 0.8392156863, blue: 0.462745098)
    @State var pastelRed = Color.init(red: 0.8392156863, green: 0.4, blue: 0.3764705882)
    
    @Binding var grades: Grades
    
    var questionAnswers: [Bool]
    var percentCorrect: Double
    var grade: Int
    var words: [Word] {
        getWords(grade)
    }
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            
            VStack {
                Text(String(format: "%.2f", percentCorrect) + "%")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 32, weight: .semibold))
                    .lineLimit(3)
                    .foregroundColor(Color("fg"))
                    .overlay(
                        ResultsView(progress: CGFloat(percentCorrect) / 100)
                            .frame(width: 200, height: 200)
                    )
                    .frame(width: 200, height: 200)
                    .padding()
                
                List {
                    ForEach(0 ..< words.count) { word in
                        NavigationLink {
                            FlashcardsView(words: words, currentWord: word)
                        } label: {
                            VStack {
                                Text(words[word].title)
                                    .foregroundColor(Color("fg"))
                                    .font(.system(size: 25))
                                    .fontWeight(.semibold)
                                
                                if let altText = words[word].altText {
                                    Text(altText)
                                        .foregroundColor(Color("fg"))
                                        .font(.system(size: 20))
                                        .fontWeight(.medium)
                                        .multilineTextAlignment(.leading)
                                }
                            }
                            .frame(width: 150, height: 42, alignment: .leading)
                        }
                        .listRowBackground(questionAnswers[word] ? Color("lightGreen") : Color("lightRed"))
                    }
                }
                .listStyle(.inset)
                .cornerRadius(10)
                .frame(height: 350, alignment: .center)
                .padding(.horizontal)
                
                Button {
                    grades.grades[grade-1].percentageCorrect = percentCorrect
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Finish")
                        .font(.system(size: 20))
                        .foregroundColor(Color("secondary"))
                        .fontWeight(.heavy)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color("primary"))
                        .cornerRadius(10)
                }
                .padding()
            }
        }
        .navigationTitle("Results")
    }
}

/* struct ActualResultsView_Previews: PreviewProvider {
 static var previews: some View {
 ActualResultsView(grades: .constant([
 Grade(number: 1, percentageCorrect: 0),
 Grade(number: 4, percentageCorrect: 0),
 Grade(number: 5, percentageCorrect: 0)]),questionAnswers: false, percentCorrect: 10, grade:1)
 }
 } */

