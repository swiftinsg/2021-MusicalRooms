import SwiftUI

struct TunerHomeView: View {
    
    @State var notes = [
        Note(name: "C", hertz: 261.63),
        Note(name: "D", hertz: 293.66),
        Note(name: "E", hertz: 329.63),
        Note(name: "F", hertz: 349.23),
        Note(name: "G", hertz: 392.00),
        Note(name: "A", hertz: 440.00),
        Note(name: "B", hertz: 493.883),
        Note(name: "Csharp", hertz: 277.18),
        Note(name: "Dsharp", hertz: 311.13),
        Note(name: "Fsharp", hertz: 369.99),
        Note(name: "Gsharp", hertz: 415.30),
        Note(name: "Asharp", hertz: 466.16)]
    
    @State var variance: Float = 0.0
    
    var body: some View {
        NavigationView{
            VStack{

                ActualTunerView()

                Spacer().frame(height: 45)

                SelectKeyView(notes: $notes)

                Spacer().frame(height: 15)

            }.navigationBarTitle("Tuner")
        }
    }
}

struct TunerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TunerHomeView()
    }
}
