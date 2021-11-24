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
        VStack{
            Text("Sightreading")
                .font(Font.system(size: 28, weight: .bold))
                .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(0 ..< clefs.count) { clef in
                    
                    ZStack{
                        
                        //Large background
                        RoundedRectangle(cornerRadius: 13)
                            .foregroundColor(Color("darkLightBrown"))
                            .frame(height: 140)
                            .padding(3)
                        

                        HStack{
                            
                            //Clef icon
                            Image(clefs[clef])
                                .foregroundColor(Color("darkerBrown"))
                                .padding()
                                .offset(x:-2)
                            
                            VStack(alignment: .leading){
                                
                                
                                Spacer().frame(height: 5)
                                //Clef title
                                Text("\(clefs[clef])")
                                    .font(Font.system(size: 26, weight: .semibold, design: .default))
                                    .foregroundColor(Color("darkerBrown"))
                                    .offset(x:-5)
                                
                                
                                //Options
                                
                                ZStack{
                                    
                                    let lightBackBrown = Color(red: 244/255, green: 232/255, blue: 216/255)
                                    
                                    Rectangle()
                                        .foregroundColor(lightBackBrown)
                                        .cornerRadius(10)
                                        .frame(width: 270, height: 70, alignment: .center)
                                        .offset(x: -5)
                                    
                                    Rectangle()
                                        .foregroundColor(Color("darkBrown"))
                                        .frame(width: 270, height: 1, alignment: .center)
                                        .offset(x: -5)
                                    
                                    //Option Buttons
                                    let types = ["Timed", "Drill"]
                                    ForEach(types, id: \.self){type in
                                        
                                        let isTimed = type == "Timed"
                                        HStack{

                                            Text(type)
                                                .font(Font.system(size: 14, weight: .heavy, design: .default))
                                                .foregroundColor(Color("darkBrown"))
                                                .frame(width: 45, height: 8, alignment: .center)
                                            
                                            Spacer().frame(width: 6)
                                            
                                            ForEach(isTimed  ? timedQuestions : drilledQuestions, id: \.self){ question in
                                                
                                                NavigationLink{
                                                    //TODO: Link to quix (isTimed ? timed : drilled)
                                                } label: {
                                                    Text("\(question)\(isTimed ? "s" : " ")")
                                                        .font(Font.system(size: 14, weight: .bold, design: .default))
                                                        .foregroundColor(Color("darkBrown"))
                                                        .frame(width: 27, height: 8, alignment: .center)
                                                }
                                                .navigationBarTitle("")
                                                .navigationBarBackButtonHidden(true)
                                                .navigationBarHidden(true)
                                                
                                            }

                                        }.offset(y: (isTimed ? -14 : 14))
                                        
                                    }
                                    //End buttons
                                    
                                }//END OPTIONS
                                .offset(x:-10, y:-8)
                                
                            }
                        }
                        
                        
                    }//END CARD
                    .padding()
                    
                    Spacer().frame(height:5)
                    
                }
                    
                    
            }
            .padding(.bottom, 22)
            
        }
        .offset(y:20)
    }
}

struct ReadingHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingHomeView()
    }
}
