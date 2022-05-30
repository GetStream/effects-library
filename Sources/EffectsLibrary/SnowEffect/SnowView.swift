//
//  SnowView.swift
//  
//
//  Created by Stefan Blos on 11.03.22.
//

import SwiftUI

public struct SnowView: View {
    
    private var config: SnowConfig
    
    public init(config: SnowConfig = SnowConfig()) {
        self.config = config
    }
    
    public var body: some View {
        GeometryReader { proxy in
            SnowViewRepresentable(proxy: proxy, config: config)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct SnowView_Previews: PreviewProvider {
    static var previews: some View {
        SnowView()
    }
}
