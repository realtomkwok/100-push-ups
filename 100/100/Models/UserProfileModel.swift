//
//  UserProfileModel.swift
//  100 Pushups
//
//  Created by Tom Kwok on 6/22/24.
//

import Foundation

enum FitnessLevel: Int, CaseIterable {
	case beginner
	case intermediate
	case advanced
	
	var imageName: String {
		switch self {
			case .beginner:
				return "figure.walk"
			case .intermediate:
				return "figure.walk.motion"
			case .advanced:
				return "figure.run"
		}
	}
	
	var title: String {
		switch self {
			case .beginner:
				return "Beginner"
			case .intermediate:
				return "Intermediate"
			case .advanced:
				return "Advanced"
		}
	}
	
	var description: String {
		switch self {
			case .beginner:
				return "Just starting out or returning after a long break."
			case .intermediate:
				return "Regularly active, familiar with workouts."
			case .advanced:
				return "Experienced, looking for new challenges"
		}
	}
	
}

struct UserProfile {
	var name: PersonNameComponents
	var fitnessLevel: FitnessLevel
}
