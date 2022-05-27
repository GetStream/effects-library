//
//  FireView.swift
//  
//
//  Created by Stefan Blos on 28.04.22.
//

import SwiftUI

public struct FireView: View {
    
    private var config: FireConfig
    
    public init(config: FireConfig = FireConfig()) {
        self.config = config
    }
    
    public var body: some View {
        GeometryReader { proxy in
            FireContainerView(proxy: proxy, config: config)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct FireView_Previews: PreviewProvider {
    static var previews: some View {
        FireView()
    }
}
