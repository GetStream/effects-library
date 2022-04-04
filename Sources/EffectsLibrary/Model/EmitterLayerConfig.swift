//
//  EmitterLayerConfig.swift
//  
//
//  Created by Stefan Blos on 04.04.22.
//

import SwiftUI

protocol EmitterLayerConfig: BaseConfig {
    var emitterPosition: EmitterPosition { get }
    var clipsToBounds: Bool { get }
}
