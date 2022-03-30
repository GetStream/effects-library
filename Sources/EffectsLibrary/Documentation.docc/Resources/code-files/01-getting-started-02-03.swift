//
//  ContentView.swift
//  EffectsExample
//
//  Created by Stefan Blos on 28.03.22.
//

import SwiftUI
import EffectsLibrary

struct ContentView: View {
    var body: some View {
        ConfettiView()
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
