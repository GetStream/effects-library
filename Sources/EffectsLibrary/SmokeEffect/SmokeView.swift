//
//  SmokeView.swift
//  
//
//  Created by Stefan Blos on 05.04.22.
//

import SwiftUI

public struct SmokeView: View {
    
    private var config: SmokeConfig
    
    public init(config: SmokeConfig = SmokeConfig()) {
        self.config = config
    }
    
    public var body: some View {
        GeometryReader { proxy in
            SmokeContainerView(proxy: proxy, config: config)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct SmokeView_Previews: PreviewProvider {
    static var previews: some View {
        SmokeView()
    }
}
