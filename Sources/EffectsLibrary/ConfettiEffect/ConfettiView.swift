//
//  ConfettiView.swift
//  
//
//  Created by Stefan Blos on 10.03.22.
//

import SwiftUI

public struct ConfettiView: View {
    
    var config: ConfettiConfig = ConfettiConfig(
        emitterPosition: .top,
        clipsToBounds: false,
        intensity: .high,
        lifetime: .medium,
        speed: .fast,
        fadeOut: .fast,
        spreadRadius: .medium,
        fallDirection: .downwards
    )
    
    public var body: some View {
        GeometryReader { proxy in
            ConfettiViewRepresentable(proxy: proxy, config: config)
        }
    }
}

struct ConfettiView_Previews: PreviewProvider {
    static var previews: some View {
        ConfettiView()
    }
}
