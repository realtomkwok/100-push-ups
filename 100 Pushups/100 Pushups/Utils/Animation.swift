//
//  Animation.swift
//  100 Pushups
//
//  Created by Tom Kwok on 6/22/24.
//

import Foundation

struct AnimationConfig {
	// Props
	var delaySec: Double
	var durationSec: Double
	var animationType: AnimationType
	// Init State
	var initOpacity: CGFloat
	var initYOffset: CGFloat
	var initBlurRadius: CGFloat
	// End State
	var endOpacity: CGFloat
	var endYOffset: CGFloat
	var endBlurRadius: CGFloat
	
	enum AnimationType {
		case EaseOutQuint
		case EaseOutExpo
	}

	init(delaySec: Double = 0.0, durationSec: Double = 2.0, animationType: AnimationType = .EaseOutExpo, initOpacity: CGFloat = 0.0, initYOffset: CGFloat = 48.0, initBlurRadius: CGFloat = 10.0, endOpacity: CGFloat = 1.0, endYOffset: CGFloat = 0.0, endBlurRadius: CGFloat = 0.0) {
		self.delaySec = delaySec
		self.durationSec = durationSec
		self.animationType = animationType
		self.initOpacity = initOpacity
		self.initYOffset = initYOffset
		self.initBlurRadius = initBlurRadius
		self.endOpacity = endOpacity
		self.endYOffset = endYOffset
		self.endBlurRadius = endBlurRadius
	}
	
}
