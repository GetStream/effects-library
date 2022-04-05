//
//  SnowView.swift
//  
//
//  Created by Stefan Blos on 11.03.22.
//

import SwiftUI

public struct SnowView: View {
    
    var config = SnowConfig(
        backgroundColor: .blue,
        intensity: .medium,
        lifetime: .long,
        initialVelocity: .medium,
        spreadRadius: .medium,
        emitterPosition: .top,
        clipsToBounds: false,
        fallDirection: .downwards
    )
    
    public var body: some View {
        GeometryReader { proxy in
            SnowViewRepresentable(proxy: proxy, config: config)
        }
    }
}

struct SnowView_Previews: PreviewProvider {
    static var previews: some View {
        SnowView()
            .edgesIgnoringSafeArea(.all)
    }
}
