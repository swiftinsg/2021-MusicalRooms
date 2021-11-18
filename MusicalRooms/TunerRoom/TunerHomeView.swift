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
        Note(name: "Csharp"),
        Note(name: "Dsharp"),
        Note(name: "Fsharp"),
        Note(name: "Gsharp"),
        Note(name: "Asharp")]
    
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
