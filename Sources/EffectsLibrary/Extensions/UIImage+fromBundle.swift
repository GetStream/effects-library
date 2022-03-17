//
//  File.swift
//  
//
//  Created by Stefan Blos on 17.03.22.
//

import UIKit

extension UIImage {
    
    static func loadFromBundle(named name: String) -> UIImage {
        return UIImage(named: name, in: Bundle.module, with: .none)!.withRenderingMode(.alwaysTemplate)
    }
    
}
