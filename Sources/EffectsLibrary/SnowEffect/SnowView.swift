//
//  SnowView.swift
//  
//
//  Created by Stefan Blos on 11.03.22.
//

import SwiftUI

struct SnowView: View {
    
    var config = SnowConfig(
        emitterPosition: .top,
        clipsToBounds: false,
        birthRate: 20,
        lifetime: 8,
        fallDirection: .downwards
    )
    var body: some View {
        GeometryReader { proxy in
            SnowViewRepresentable(proxy: proxy, config: config)
        }
    }
}

struct SnowView_Previews: PreviewProvider {
    static var previews: some View {
        SnowView()
    }
}
