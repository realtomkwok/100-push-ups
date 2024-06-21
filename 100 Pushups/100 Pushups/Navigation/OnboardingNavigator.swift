//
//  OnboardingNavigator.swift
//  100 Pushups
//
//  Created by Tom Kwok on 6/21/24.
//

import SwiftUI

struct OnboardingNavigator: View {
	@State private var currentSetupStep = 0
	
    var body: some View {
		VStack {
			if currentSetupStep == 0 {
				WelcomeView(currentSetupStep: $currentSetupStep)
			}
		}
    }
}

#Preview {
    OnboardingNavigator()
}
