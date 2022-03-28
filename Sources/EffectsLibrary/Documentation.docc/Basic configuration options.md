# Basic effect configuration options

This article gives an overview over the configuration options that are common for all affects in the package.


## Overview

We aim to build our effects in a way that it's easy and intuitive to use. However, this might not always be possible so in this article we want to exaplain to you the basic effect configuration options (meaning: parameters of `Config` files) that you can use for each and every effect of our package.

If there's still things remaining unclear, feel free to contact us for clarification.


- **Render Mode:** Options (Unordered, oldest first, oldest last, back to front, additive). It defines how emitter cells are rendered into the view.
- **Amount of particles** (Birthrate): An animatable property that increments the particle cells.
- **Velocity:** An animatable property that multiplies the particle cells’ velocity. The default value is `1`. You can use the range of `-500 to 500`.
- Scale: Defines a multiplier applied to the cell-defined particle scale. Use the range of `-100 to 100`.
- Speed. NB: Different from the velocity settings
- Position

## Topics

### <!--@START_MENU_TOKEN@-->Group<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->``Symbol``<!--@END_MENU_TOKEN@-->
