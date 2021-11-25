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
                            OverviewView(grade: grade.number )
                        } label: {
                            VStack(alignment: .leading) {
                                HStack(alignment: .bottom) {
                                    Text("Grade \(grade.number)")
                                            .multilineTextAlignment(.leading)
                                            .font(Font.system(size: 25, weight: .semibold, design: .rounded))
                                            .lineLimit(3)
                                            .foregroundColor(Color("darkerBrown"))

                                    Text(String(format: "%.2f", grade.percentageCorrect) + "%")
                                            .multilineTextAlignment(.leading)
                                            .font(Font.system(size: 25, weight: .semibold, design: .rounded))
                                            .lineLimit(3)
                                            .foregroundColor(Color("darkerBrown"))
                                            .offset(x: 100)

                                }.offset(y: -20)

                                //PROGRESS BAR
                                RoundedRectangle(cornerRadius: 5)
                                        .fill(
                                                LinearGradient(gradient: Gradient(stops: [
                                                    .init(color: Color("darkBrown"), location: grade.percentageCorrect/100),
                                                    .init(color: Color("darkLightBrown"), location: grade.percentageCorrect/100)
                                                ]), startPoint: .leading, endPoint: .trailing)
                                        )
                                        .foregroundColor(Color("darkLightBrown"))
                                        .frame(width: 300, height: 10, alignment: .leading)
                            }
                                    .padding()
                                    .frame(width: 330, height: 135, alignment: .leading)
                                    .background(Color("lightBrown"))
                                    .cornerRadius(10)
                        }.frame(width: 400)//END LABEL
                    }
                }.padding(.bottom, 22)
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
