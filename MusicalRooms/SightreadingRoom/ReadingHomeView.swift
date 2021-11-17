//
//  ReadingHomeView.swift
//  MusicalRooms
//
//  Created by sap on 15/11/21.
//

import SwiftUI

struct ReadingHomeView: View {

    @State var clefs = ["Treble", "Alto", "Tenor", "Bass"]
    @State var timedQuestions = [15,30,45,60]
    @State var drilledQuestions = [10,20,30,40]

    var body: some View {

        //Header
        VStack(alignment: .leading) {
            Text("Sightreading")
                .font(Font.system(size: 32, weight: .bold))
                .frame( alignment: .leading)
                .padding()

            ScrollView(.vertical, showsIndicators: false) {
                ForEach(0 ..< clefs.count) { clef in
                    HStack(alignment: .center) {
                        Image (clefs[clef])
                        VStack(alignment: .leading) {
                            Text(clefs[clef])
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.leading)
                                .font(.system(.title, design: .rounded))
                                .lineLimit(3)
                                .foregroundColor(Color("darkBrown"))

                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Timed:")
                                        .frame(width: 60, height: 20)
                                    HStack {
                                        ForEach(0 ..< timedQuestions.count) { time in
                                            Text("\(timedQuestions[time])s")
                                                .frame(width: 40, height: 20, alignment: .center)
                                                .onTapGesture {
                                                    //navigation link to be addded to SightreadingQuizView
                                                }
                                        }
                                    }
                                }
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 20,design: .rounded))
                                .lineLimit(3)
                                .foregroundColor(Color("darkerBrown"))

                                HStack {
                                    Text("Drill:")
                                        .frame(width: 60, height: 20, alignment: .leading)
                                    HStack {
                                        ForEach(0 ..< drilledQuestions.count) { drill in
                                            Text("\(drilledQuestions[drill])")
                                                .frame(width: 40, height: 20, alignment: .center)
                                                .onTapGesture {

                                                }
                                        }
                                    }
                                }
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 20,design: .rounded))
                                .lineLimit(3)
                                .foregroundColor(Color("darkerBrown"))
                            }
                            .padding()
                            .frame(width: 280, height: 80, alignment: .leading)
                            .background( Color("evenLighterBrown"))
                            .cornerRadius(20)

                        }
                    }
                    .padding()
                    .frame(width: 370, height: 160, alignment: .leading)
                    .background(Color("lightBrown"))
                    .cornerRadius(20)
                }
            }
        }
        .offset(y:20)
    }
}

struct ReadingHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingHomeView()
    }
}
