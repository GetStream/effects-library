//
//  BaseConfig.swift
//  
//
//  Created by Stefan Blos on 11.03.22.
//

import SwiftUI

protocol BaseConfig {
    var content: [Content] { get set }
    var emitterPosition: EmitterPosition { get set}
    var clipsToBounds: Bool { get set}
    var backgroundColor: Color { get set }
}
