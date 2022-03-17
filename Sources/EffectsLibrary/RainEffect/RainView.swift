//
//  RainView.swift
//  
//
//  Created by Stefan Blos on 17.03.22.
//

import SwiftUI

struct RainView: View {
    
    var config = RainConfig(
        emitterPosition: .top,
        clipsToBounds: false,
        birthRate: 200,
        lifetime: 10,
        fallDirection: .downwards
    )
    
    var body: some View {
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
