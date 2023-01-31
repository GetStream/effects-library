//
//  File.swift
//  
//
//  Created by Stefan Blos on 17.03.22.
//

import SwiftUI

#if os(iOS) || os(watchOS)
extension UIImage {
    
    public static func loadFromBundle(named name: String) -> UIImage {
        return UIImage(named: name, in: Bundle.module, with: .none)!.withRenderingMode(.alwaysTemplate)
    }
    
}
#elseif os(OSX)
extension NSImage {
    
    public static func loadFromBundle(named name: String) -> NSImage {
        return NSImage(named: name)!
    }
}
#endif
