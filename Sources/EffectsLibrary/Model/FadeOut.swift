//
//  FadeOut.swift
//  
//
//  Created by Stefan Blos on 30.03.22.
//

import Foundation


/// The FadeOut describes how fast elements will fade into translucency.
///
/// This control is applied to each particle of the effect and not the effect itself. It is somewhat related to the `lifetime` (see ``Lifetime``) but wheres the `lifetime` will apruptly remove the particle entirely from the screen the fadeout will slowly reduce the opacity of each particle and has a way more subtle effect.
///
/// The 4 possible values are:
/// - `.none`: The particles will never fade out. Default
/// - `.slow`: The particles will only slowly fade out.
/// - `.medium`: The particles will face out over a medium time period.
/// - `.fast`: The particles will fade out and disappear quickly.
public enum FadeOut {
    case none, slow, medium, fast
}
