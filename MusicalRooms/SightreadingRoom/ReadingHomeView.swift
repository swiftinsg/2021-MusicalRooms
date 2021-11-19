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
                    
                    ZStack{
                        
                        //Large background
                        Rectangle()
                            .foregroundColor(Color("evenLighterBrown"))
                            .cornerRadius(13)
                            .frame(width: 340, height: 140, alignment: .center)
                        
                        HStack{
                            
                            //Clef icon
                            Image(clefs[clef])
                                .foregroundColor(Color("lightBrown"))
                                .padding(5)
                            
                            VStack(alignment: .leading){
                                
                                //Clef title
                                Text("\(clefs[clef])")
                                    .font(Font.system(size: 26, weight: .semibold, design: .default))
                                    .frame(alignment: .leading)
                                    .offset(x: 15)
                                    .foregroundColor(Color("darkBrown"))
                                
                                //Options
                                
                                ZStack{
                                    
                                    let lightBackBrown = Color(red: 244/255, green: 232/255, blue: 216/255)
                                    
                                    Rectangle()
                                        .foregroundColor(lightBackBrown)
                                        .cornerRadius(10)
                                        .frame(width: 240, height: 70, alignment: .center)
                                    
                                    Rectangle()
                                        .foregroundColor(Color("darkBrown"))
                                        .frame(width: 240, height: 1, alignment: .center)
                                    
                                    //Option Buttons
                                    let types = ["Timed", "Drill"]
                                    ForEach(types, id: \.self){type in
                                        
                                        let isTimed = type == "Timed"
                                        HStack{
                                            if(!isTimed){Spacer().frame(width: 5)}
                                            
                                            Text(type)
                                                .font(Font.system(size: 14, weight: .medium, design: .default))
                                                .foregroundColor(Color("darkBrown"))
                                            Spacer().frame(width: (isTimed ? 16 : 30))
                                            
                                            ForEach(isTimed  ? timedQuestions : drilledQuestions, id: \.self){ question in
                                                
                                                NavigationLink{
                                                    //TODO: Link to quix (isTimed ? timed : drilled)
                                                } label: {
                                                    Text("\(question)\(isTimed ? "s" : " ")")
                                                        .font(Font.system(size: 14, weight: .bold, design: .default))
                                                        .foregroundColor(Color("darkBrown"))
                                                }
                                                Spacer().frame(width: isTimed ? 12 : 16.5)
                                                
                                            }
                                        }.offset(y: (isTimed ? -14 : 14))
                                        
                                    }
                                    //End buttons
                                    
                                }.offset(y:-8)
                            }
                        }
                        
                    }
                    
                    Spacer().frame(height:20)
                    
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
