//
//  Typealiases.swift
//  
//
//  Created by Stefan Blos on 10.01.23.
//

import SwiftUI

#if os(iOS) || os(watchOS)
public typealias MyImage = UIImage
#elseif os(OSX)
public typealias MyImage = NSImage
#endif
