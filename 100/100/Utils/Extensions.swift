//
//  Animation.swift
//  100 Pushups
//
//  Created by Tom Kwok on 6/21/24.
//

import SwiftUI

extension Animation {
	static func EaseOutQuint(duration: Double) -> Animation {
		return Animation.timingCurve(0.22, 1, 0.36, 1, duration: duration)
	}
	static func EaseOutExpo(duration: Double) -> Animation {
		return Animation.timingCurve(0.16, 1, 0.3, 1, duration: duration)
	}
}

