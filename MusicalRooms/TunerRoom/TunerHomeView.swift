import SwiftUI
import SwiftySound

struct Note: Identifiable, Equatable {
    var id = UUID()
    
    var name: String
    var isSelected: Bool = false
}

struct TunerHomeView: View {
    
    @State var notes = [
        Note(name: "C"),
        Note(name: "D"),
        Note(name: "E"),
        Note(name: "F"),
        Note(name: "G"),
        Note(name: "A"),
        Note(name: "B"),
        Note(name: "C#"),
        Note(name: "D#"),
        Note(name: "F#"),
        Note(name: "G#"),
        Note(name: "A#")]
    
    fileprivate func selectSelectedKey(_ note: Int) {
        for num in 0 ..< notes.count {
            notes[num].isSelected = false
        }
        notes[note].isSelected.toggle()
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(7 ..< notes.count) { note in
                    Button {
                        selectSelectedKey(note)
                    } label: {
                        VStack {
                            Text(notes[note].name)
                                .fontWeight(.semibold)
                            Text(getEnharmonic(notes[note].name))
                                .fontWeight(.semibold)
                        }
                        .font(.system(size: 20, design: .rounded))
                        .multilineTextAlignment(.center)
                        .foregroundColor(!notes[note].isSelected ? Color("darkBrown") : Color("evenLighterBrown"))
                    }
                    .padding()
                    .frame(width:60, height: 100, alignment: .leading)
                    .background(!notes[note].isSelected ? Color("evenLighterBrown") : Color("darkBrown"))
                    .cornerRadius(20)
                }
            }
            
            Spacer()
                .frame(height: 50)
            HStack {
                ForEach(0 ..< 7) { note in
                    Button {
                        selectSelectedKey(note)
                    } label: {
                        Text(notes[note].name)
                            .bold()
                            .font(.system(size: 20, design: .rounded))
                            .multilineTextAlignment(.center)
                            .foregroundColor(!notes[note].isSelected ? Color("darkBrown") : Color("evenLighterBrown"))
                    }
                    .padding()
                    .frame(width:50, height: 50, alignment: .leading)
                    .background(!notes[note].isSelected ? Color("evenLighterBrown") : Color("darkBrown"))
                    .cornerRadius(20)
                }
            }
            
            Spacer()
                .frame(height: 35)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 350, height: 120)
                .foregroundColor(Color("darkerBrown"))
                .overlay(
                    HStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "tuningfork")
                                .font(Font.title)
                                .frame(width: 80, height: 80, alignment: .center)
                                .foregroundColor(Color("darkBrown"))
                                .background(Color("lightBrown"))
                                .cornerRadius(20)
                                .offset(x: -40)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "speaker.wave.3")
                                .font(Font.title)
                                .frame(width: 80, height: 80, alignment: .center)
                                .foregroundColor(Color("darkBrown"))
                                .background(Color("lightBrown"))
                                .cornerRadius(20)
                                .offset(x: 40)
                        }
                    }
                        .frame(width: 350, height: 120, alignment: .center)
                )
        }
    }
}

struct TunerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TunerHomeView()
    }
}
