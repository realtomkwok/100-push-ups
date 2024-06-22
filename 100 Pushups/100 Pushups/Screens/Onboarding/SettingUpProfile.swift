//
//  SettingUpProfile.swift
//  100 Pushups
//
//  Created by Tom Kwok on 6/21/24.
//

import SwiftUI

struct SettingUpProfile: View {
	@Binding var currentSetupStep: Int
	
    var body: some View {
        OnboardingHeader(title: "Leave Your", title2: "Mark", icon: "person.crop.circle.fill")
		// TODO: Textfield: Name
		// TODO: Select: Fitness Level (3)
    }
}

#Preview {
	SettingUpProfile(currentSetupStep: .constant(2))
}
