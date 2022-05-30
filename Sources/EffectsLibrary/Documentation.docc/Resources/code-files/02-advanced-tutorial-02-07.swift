import SwiftUI
import EffectsLibrary

struct ContentView: View {
    
    var config = FireworksConfig(
        intensity: .high,
        lifetime: .long
    )
    
    var body: some View {
        FireworksView(config: config)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
