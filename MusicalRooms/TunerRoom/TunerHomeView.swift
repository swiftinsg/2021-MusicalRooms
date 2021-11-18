import SwiftUI

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
            SelectKeyView(notes: $notes)
        }
    }
}

struct TunerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TunerHomeView()
    }
}
