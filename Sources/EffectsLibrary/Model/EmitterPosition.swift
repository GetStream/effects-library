//
//  File.swift
//  
//
//  Created by Stefan Blos on 11.03.22.
//

import Foundation

/// The `EmitterPosition` enum allows you to specify where in the `View` you are creating for your effect the particles should be emitted from.
///
/// There are 3 possible cases here:
/// - `.top`: emitter cells will be positioned at the top of the `View` encapsulating it (e.g. ``ConfettiView``, ``RainView``, or ``SnowView``).
/// - `.center`: .emitter cells will be positioned in the (vertical) center of the encapsulating `View`.
/// - `.bottom`: emitter cells will be position at the bottom of the `View`.
///
///  The value only become relevant  if the view is having a significant size. Depending on the position you are specifying for the emitter the value that is set in the respective config for the ``FallDirection`` can also become relevant.
public enum EmitterPosition {
    case top, center, bottom
}
