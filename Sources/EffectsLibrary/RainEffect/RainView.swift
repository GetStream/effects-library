//
//  RainView.swift
//  
//
//  Created by Stefan Blos on 17.03.22.
//

import SwiftUI

public struct RainView: View {
    
    private var config: RainConfig
    
    public init(config: RainConfig = RainConfig()) {
        self.config = config
    }
    
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
