//
//  CommonTuningsView.swift
//  MusicalRooms
//
//  Created by Chelsea Ling on 26/11/21.
//

import SwiftUI

struct CommonTuningsView: View {
   
    var tunings = [Tuning(name:"Standard",
                          notes: "E A D G B E"),
                   Tuning(name:"Drop D",
                          notes: "D A D G B E"),
                   Tuning(name:"Drop C#",
                          notes: "C♯ A D G B E"),
                   Tuning(name:"Drop C",
                          notes: "C G C F A D"),
                   Tuning(name:"Drop B",
                          notes: "B G♭ B E A♭ D♭"),
                   Tuning(name:"Drop A",
                          notes: "A E A D G♭ B"),
                   Tuning(name:"DADGAD",
                          notes: "D A D G A D"),
                   Tuning(name:"Half Step Down",
                          notes: "E♭ A♭ D♭ G♭ B♭ E♭"),
                   Tuning(name:"Full Step Down",
                          notes: "D G C F A D"),
                   Tuning(name:"Half Step Up",
                          notes: "F A♯ D♯ G♯ C F"),
                   Tuning(name:"Open C",
                          notes: "C G C G C E"),
                   Tuning(name:"Open D",
                          notes: "D A D F♯ A D"),
                   Tuning(name:"Open E",
                          notes: "E B E G♯ B E"),
                   Tuning(name:"Open F",
                          notes: "F A C F C F"),
                   Tuning(name:"Open G",
                          notes: "D G D G B D"),
                   Tuning(name:"Open A",
                          notes: "E A E A C♯ E")]
    
    var body: some View {
            NavigationView {
                VStack (alignment: .leading){
                    List{
                        Section{
                            ForEach(tunings){ tuning in
                                HStack{
                                    Text(tuning.name)
                                            .foregroundColor(Color("darkerBrown"))
                                            .font(.system(size: 18, design: .rounded))
                                            .fontWeight(.bold)
                                            .padding(.leading, 5)
                                    Spacer()

                                    Text(tuning.notes)
                                            .foregroundColor(Color("darkBrown"))
                                            .font(.system(size: 20, design: .rounded))
                                            .fontWeight(.medium)
                                            .multilineTextAlignment(.leading)
                                            .padding(.trailing, 5)
                                }.padding(10)
                            }
                        } header: {
                            Text("Guitar 🎸")
                                    .foregroundColor(Color("darkerBrown"))
                                    .font(Font.system(size: 18, weight: .semibold, design: .rounded))
                        }.listRowBackground(Color("lightBrown"))
                    }
                    .listStyle(.automatic)
                    .padding(.horizontal, 5)
                    .cornerRadius(15)
                    .listStyle(.inset)
                    .navigationTitle("Common Tunings")
                    .offset(y: 10)
                }
        }
        .onAppear{
            UITableView.appearance().backgroundColor = .clear
        }
            
    }
}

struct CommonTuningsView_Previews: PreviewProvider {
    static var previews: some View {
        CommonTuningsView()
    }
}
