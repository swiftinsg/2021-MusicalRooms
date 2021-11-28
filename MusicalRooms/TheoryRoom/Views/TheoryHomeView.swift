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
                                        .multilineTextAlignment(.leading)
                                        .font(Font.system(size: 25, weight: .semibold, design: .rounded))
                                        .lineLimit(3)
                                        .foregroundColor(Color("darkerBrown"))
                                    Spacer()

                                    Text(String(format: "%.2f", grade.percentageCorrect) + "%")
                                        .multilineTextAlignment(.leading)
                                        .font(Font.system(size: 25, weight: .semibold, design: .rounded))
                                        .lineLimit(3)
                                        .foregroundColor(Color("darkerBrown"))
                                        .padding(.trailing, 15)
                                        .overlay(
                                            Text("Last Score")
                                                .foregroundColor(Color("darkerBrown"))
                                                .font(Font.system(size: 14, weight: .light, design: .rounded))
                                                .offset(x: -10, y:22)
                                        )

                                }
                                .padding(.top)

                                Spacer().frame(height:40)
                                //PROGRESS BAR
                                RoundedRectangle(cornerRadius: 5)
                                        .fill(
                                                LinearGradient(gradient: Gradient(stops: [
                                                    .init(color: Color("darkBrown"), location: grade.percentageCorrect/100),
                                                    .init(color: Color("darkLightBrown"), location: grade.percentageCorrect/100)
                                                ]), startPoint: .leading, endPoint: .trailing)
                                        )
                                        .foregroundColor(Color("darkLightBrown"))
                            }
                            .padding()
                            .background(Color("lightBrown"))
                            .cornerRadius(10)
                        }
                        //END LABEL
                    }
                }
                .padding(.bottom, 22)
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
