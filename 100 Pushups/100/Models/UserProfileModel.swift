//
//  UserProfileModel.swift
//  100 Pushups
//
//  Created by Tom Kwok on 6/22/24.
//

import Foundation

enum FitnessLevel {
	case beginner, intermediate, advanced
}

struct UserProfile {
	var firstName: String
	var fitnessLevel: FitnessLevel
}
