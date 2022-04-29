//
//  FireView.swift
//  
//
//  Created by Stefan Blos on 28.04.22.
//

import SwiftUI

struct FireView: View {
    
    var config = FireConfig(
        intensity: .medium,
        lifetime: .long,
        initialVelocity: .medium,
        fadeOut: .medium,
        spreadRadius: .high
    )
    
    var body: some View {
        GeometryReader { proxy in
            FireContainerView(proxy: proxy, config: config)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct FireView_Previews: PreviewProvider {
    static var previews: some View {
        FireView()
    }
}
