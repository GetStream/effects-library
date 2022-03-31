//
//  RainView.swift
//  
//
//  Created by Stefan Blos on 17.03.22.
//

import SwiftUI

public struct RainView: View {
    
    var config = RainConfig(
        emitterPosition: .top,
        clipsToBounds: false,
        intensity: .low,
        lifetime: .medium,
        speed: .medium,
        fadeOut: .fast,
        spreadRadius: .medium,
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
