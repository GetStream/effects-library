//
//  ConfettiView.swift
//  
//
//  Created by Stefan Blos on 10.03.22.
//

import SwiftUI

public struct ConfettiView: View {
    
    private var config: ConfettiConfig
    
    public init(config: ConfettiConfig = ConfettiConfig()) {
        self.config = config
    }
    
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
