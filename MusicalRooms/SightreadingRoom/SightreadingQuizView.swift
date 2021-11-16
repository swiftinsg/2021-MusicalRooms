//
//  SightreadingQuizView.swift
//  MusicalRooms
//
//  Created by Chelsea Ling on 16/11/21.
//

import SwiftUI

struct SightreadingQuizView: View {
    var body: some View {
        
        VStack (alignment:.center, spacing: 50){
            HStack(alignment: .bottom) {
                
                VStack(alignment: .leading) {
                    
                    Text("1/10") // add in question number var later, also idk how to do the thing in the prototype if anyone can help me with it thx :3
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .font(.system(.title, design: .rounded))
                        .lineLimit(3)
                        .foregroundColor(Color("darkBrown"))
                    
                    Spacer()
                    
                }
            }
            .padding()
            .frame(width:350, height: 250, alignment: .leading)
            .background( Color("lightBrown"))
            .cornerRadius(20)
            
            
            VStack{
                HStack{
                    //C
                    Button{
                    } label:{
                        Text("C")
                            .foregroundColor(Color("darkBrown"))
                            .font(.system(size: 45, design: .rounded))
                            .fontWeight(.semibold)
                            .lineLimit(3)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(width:70, height: 70, alignment: .leading)
                    .background( Color("evenLighterBrown"))
                    .cornerRadius(20)
                    
                    //D
                    
                    Button{
                    } label:{
                        Text("D")
                            .foregroundColor(Color("darkBrown"))
                            .font(.system(size: 45, design: .rounded))
                            .fontWeight(.semibold)
                            .lineLimit(3)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(width:70, height: 70, alignment: .leading)
                    .background( Color("evenLighterBrown"))
                    .cornerRadius(20)
                    
                    //F
                    Button{
                    } label:{
                        Text("E")
                            .foregroundColor(Color("darkBrown"))
                            .font(.system(size: 45, design: .rounded))
                            .fontWeight(.semibold)
                            .lineLimit(3)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(width:70, height: 70, alignment: .leading)
                    .background( Color("evenLighterBrown"))
                    .cornerRadius(20)
                    
                }
                HStack{
                    
                    // G
                    Button{
                    } label:{
                        Text("F")
                            .foregroundColor(Color("darkBrown"))
                            .font(.system(size: 45, design: .rounded))
                            .fontWeight(.semibold)
                            .lineLimit(3)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(width:70, height: 70, alignment: .leading)
                    .background( Color("evenLighterBrown"))
                    .cornerRadius(20)
                    
                    //D
                    
                    Button{
                    } label:{
                        Text("G")
                            .foregroundColor(Color("darkBrown"))
                            .font(.system(size: 45, design: .rounded))
                            .fontWeight(.semibold)
                            .lineLimit(3)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(width:70, height: 70, alignment: .leading)
                    .background( Color("evenLighterBrown"))
                    .cornerRadius(20)
                    
                    //A
                    Button{
                    } label:{
                        Text("A")
                            .foregroundColor(Color("darkBrown"))
                            .font(.system(size: 45, design: .rounded))
                            .fontWeight(.semibold)
                            .lineLimit(3)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(width:70, height: 70, alignment: .leading)
                    .background( Color("evenLighterBrown"))
                    .cornerRadius(20)
                    
                    //B
                    Button{
                    } label:{
                        Text("B")
                            .foregroundColor(Color("darkBrown"))
                            .font(.system(size: 45, design: .rounded))
                            .fontWeight(.semibold)
                            .lineLimit(3)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .frame(width:70, height: 70, alignment: .leading)
                    .background( Color("evenLighterBrown"))
                    .cornerRadius(20)
                    
                }
            }
            
            // Sharps and flats
            VStack{
                HStack{
                    
                    // C#
                    Button{
                    } label:{
                        Text("C# D♭")
                            .foregroundColor(Color("darkBrown"))
                            .font(.system(size: 29, design: .rounded))
                            .lineLimit(3)
                            .multilineTextAlignment(.leading)
                    }
                    .padding()
                    .frame(width:71, height: 130, alignment: .leading)
                    .background( Color("evenLighterBrown"))
                    .cornerRadius(20)
                    
                    //D flat E sharp
                    
                    Button{
                    } label:{
                        Text("D# E♭")
                            .foregroundColor(Color("darkBrown"))
                            .font(.system(size: 29, design: .rounded))
                            .lineLimit(3)
                            .multilineTextAlignment(.leading)
                    }
                    .padding()
                    .frame(width:70, height: 130, alignment: .leading)
                    .background( Color("evenLighterBrown"))
                    .cornerRadius(20)
                    
                    //F sharp G flat
                    
                    Button{
                    } label:{
                        Text("F# G♭")
                            .foregroundColor(Color("darkBrown"))
                            .font(.system(size: 29, design: .rounded))
                            .lineLimit(3)
                            .multilineTextAlignment(.leading)
                    }
                    .padding()
                    .frame(width:69, height: 130, alignment: .leading)
                    .background( Color("evenLighterBrown"))
                    .cornerRadius(20)
                    
                    // G sharp A flat
                    
                    Button{
                    } label:{
                        Text("G# A♭")
                            .foregroundColor(Color("darkBrown"))
                            .font(.system(size: 29, design: .rounded))
                            .lineLimit(3)
                            .multilineTextAlignment(.leading)
                    }
                    .padding()
                    .frame(width:71, height: 130, alignment: .leading)
                    .background( Color("evenLighterBrown"))
                    .cornerRadius(20)
                    
                    //A sharp B flat
                    
                    Button{
                    } label:{
                        Text("A#B♭")
                            .foregroundColor(Color("darkBrown"))
                            .font(.system(size: 29, design: .rounded))
                            .lineLimit(3)
                            .multilineTextAlignment(.leading)
                    }
                    .padding()
                    .frame(width:69, height: 130, alignment: .leading)
                    .background( Color("evenLighterBrown"))
                    .cornerRadius(20)
                }
            }
        }
        
    }
}

struct SightreadingQuizView_Previews: PreviewProvider {
    static var previews: some View {
        SightreadingQuizView()
    }
}
