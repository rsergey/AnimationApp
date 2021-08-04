//
//  Animation.swift
//  AnimationApp
//
//  Created by Sergey on 03.08.2021.
//

import Spring

struct Animation {
    // Public Properties
    let preset: Spring.AnimationPreset
    let curve: Spring.AnimationCurve
    let forse: CGFloat
    let duration: CGFloat
    
    // MARK: - Static Methods
    static func getAnimations() -> [Animation] {
        var animations: [Animation] = []
        let animationPresets = Spring.AnimationPreset.allCases
        let animationCurves = Spring.AnimationCurve.allCases
        
        for animationPreset in animationPresets {
            animations.append(Animation(preset: animationPreset,
                                        curve: animationCurves.randomElement() ?? .easeIn,
                                        forse: CGFloat.random(in: 0.5...2),
                                        duration: CGFloat.random(in: 1...2.5)))
        }
        return animations
    }
    
    static func getDefaultRandomAnimation() -> Animation {
        Animation(preset: Spring.AnimationPreset.allCases.randomElement() ?? .fadeIn,
                  curve: Spring.AnimationCurve.allCases.randomElement() ?? .easeIn,
                  forse: CGFloat.random(in: 0.5...2),
                  duration: CGFloat.random(in: 1...2.5))
    }
}
