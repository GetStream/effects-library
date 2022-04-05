//
//  RainView.swift
//  
//
//  Created by Stefan Blos on 17.03.22.
//

import SwiftUI

public struct RainView: View {
    
    var config = RainConfig(
        intensity: .high,
        lifetime: .medium,
        initialVelocity: .medium,
        fadeOut: .fast,
        spreadRadius: .medium,
        emitterPosition: .top,
        clipsToBounds: false,
        fallDirection: .downwards
    )
    
    public var body: some View {
        GeometryReader { proxy in
            RainViewRepresentable(proxy: proxy, config: config)
        }
    }
}

struct RainView_Previews: PreviewProvider {
    static var previews: some View {
        RainView()
    }
}
