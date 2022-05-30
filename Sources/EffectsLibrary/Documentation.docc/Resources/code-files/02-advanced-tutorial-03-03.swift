import SwiftUI
import EffectsLibrary

struct ContentView: View {
    
    var config = FireworksConfig(
        content: [
            .shape(.triangle, .blue, 10.0),
            .shape(.square, .green, 10.0),
            .shape(.circle, .red, 10.0)
        ],
        intensity: .medium,
        lifetime: .long,
        initialVelocity: .medium,
        fadeOut: .slow
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
