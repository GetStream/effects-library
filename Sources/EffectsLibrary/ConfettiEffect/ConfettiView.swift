//
//  ConfettiView.swift
//  
//
//  Created by Stefan Blos on 10.03.22.
//

import SwiftUI

@available(iOS 14.0, *)
public struct ConfettiView: View {
    
    var config = ConfettiConfig(
        emitterPosition: .top,
        clipsToBounds: false,
        birthRate: 20,
        lifetime: 8,
        fallDirection: .downwards
    )
    
    public var body: some View {
        GeometryReader { proxy in
            ConfettiViewRepresentable(proxy: proxy, config: config)
        }
    }
}

@available(iOS 14.0, *)
struct ConfettiView_Previews: PreviewProvider {
    static var previews: some View {
        ConfettiView()
    }
}
