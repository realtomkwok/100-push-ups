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
					.transition(.blurReplace(.upUp)
						.animation(.smooth(duration: 0.6)))
			} else if currentSetupStep == 1 {
				SetUpProfileView(currentSetupStep: $currentSetupStep)
					.transition(.blurReplace(.upUp)
						.animation(.smooth(duration: 0.6)))
			}
		}
    }
}

#Preview {
    OnboardingNavigator()
}
