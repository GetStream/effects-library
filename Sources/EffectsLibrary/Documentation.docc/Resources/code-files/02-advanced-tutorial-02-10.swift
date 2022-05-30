import SwiftUI
import EffectsLibrary

struct ContentView: View {
    
    var config = FireworksConfig(
        backgroundColor: .blue.opacity(0.4),
        intensity: .high,
        lifetime: .long,
        initialVelocity: .fast,
        fadeOut: .none
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
