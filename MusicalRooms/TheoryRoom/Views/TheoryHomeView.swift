//
//  TheoryHomeView.swift
//  MusicalRooms
//
//  Created by sap on 15/11/21.
//
import SwiftUI

struct TheoryHomeView: View {

    @Binding var grades: [Grade]
    @State var percentCorrect: Float = 50

    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
                    ForEach(grades) { grade in
                        NavigationLink {
                            OverviewView(grades: $grades, grade: grade.number)
                        } label: {
                            VStack(alignment: .leading) {

                                HStack(alignment: .bottom) {
                                    Text("Grade \(grade.number)")
                                        .font(.system(size: 25, weight: .semibold))
                                        .foregroundColor(Color("fg"))
                                    Spacer()

                                    Text(String(format: "%.2f", grade.percentageCorrect) + "%")
                                        .font(.system(size: 25, weight: .semibold))
                                        .foregroundColor(Color("fg"))
                                        .padding(.trailing, 15)
                                        .overlay(
                                            Text("Last Score")
                                                .foregroundColor(Color("fg"))
                                                .font(.system(size: 14, weight: .light))
                                                .offset(x: -10, y:22)
                                        )

                                }
                                .padding(.top)

                                Spacer().frame(height:40)
                                //PROGRESS BAR
                                RoundedRectangle(cornerRadius: 5)
                                        .fill(
                                                LinearGradient(gradient: Gradient(stops: [
                                                    .init(color: Color("fg"), location: grade.percentageCorrect/100),
                                                    .init(color: Color("primary"), location: grade.percentageCorrect/100)
                                                ]), startPoint: .leading, endPoint: .trailing)
                                        )
                                        .foregroundColor(Color("primary"))
                                        .padding(.bottom, 10)
                            }
                            .padding()
                            .background(Color("secondary"))
                            .cornerRadius(10)
                        }
                        .padding(.bottom, 5)
                        //END LABEL
                    }
                }
                .padding(.bottom, 14)
                .padding(.horizontal)
            }
            .navigationTitle("Theory")
            .offset(y:20)
        }

    }
}

struct TheoryHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TheoryHomeView(grades: .constant([
            Grade(number: 1, percentageCorrect: 0),
            Grade(number: 4, percentageCorrect: 0),
            Grade(number: 5, percentageCorrect: 0)]))
    }
}
