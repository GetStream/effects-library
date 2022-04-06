//
//  SmokeView.swift
//  
//
//  Created by Stefan Blos on 05.04.22.
//

import SwiftUI

public struct SmokeView: View {
    
    var config = SmokeConfig(
        intensity: .high,
        lifetime: .long
    )
    
    public var body: some View {
        GeometryReader { proxy in
            SmokeContainerView(proxy: proxy, config: config)
        }
    }
}

struct SmokeView_Previews: PreviewProvider {
    static var previews: some View {
        SmokeView()
    }
}
