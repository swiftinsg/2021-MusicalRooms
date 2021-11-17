import SwiftUI

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

    var body: some View {
        VStack {
            HStack {
                ForEach(7 ..< notes.count) { note in
                    Button {
                        for num in 0 ..< notes.count {
                            notes[num].isSelected = false
                            print(index)
                        }
                        notes[note].isSelected.toggle()
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
            HStack {
                ForEach(7 ..< notes.count) { note in
                    Button {
                        
                    } label: {
                        Text(notes[note].name)
                    }
                }
            }
        }
    }
}

struct TunerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TunerHomeView()
    }
}
