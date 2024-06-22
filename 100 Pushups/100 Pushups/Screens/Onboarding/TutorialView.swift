//
//  SetUpProfileView.swift
//  100 Pushups
//
//  Created by Tom Kwok on 6/21/24.
//

import SwiftUI

struct TutorialView: View {
	@Binding var currentSetupStep: Int
	@State private var onExit: Bool = false
	
	var title: String = "Easy as"
	var subtitle: String = "1-2-3"
	var animationDelay: CGFloat = 1
	var totalDelay: CGFloat = 0
	
	let exitAnimationConfig = AnimationConfig(delaySec: 1.0)
	
	// Header
	@State private var headerOpacity: CGFloat = 0
	@State private var headerYOffset: CGFloat = 64
	@State private var headerBlurRadius: CGFloat = 10.0

	// Information
	@State private var informationOpacity: CGFloat = 0
	@State private var informationYOffset: CGFloat = 64
	@State private var informationBlurRadius: CGFloat = 10.0
	
	// Button
	@State private var buttonOpacity: CGFloat = 0
	@State private var buttonYOffset: CGFloat = 24
	@State private var buttonBlurRadius: CGFloat = 10.0
	
	
    var body: some View {
		VStack {
			VStack(alignment: .leading) {
				OnboardingHeader(title: title, title2: subtitle, title2Size: 64, icon: "hands.clap")
					.opacity(headerOpacity)
					.offset(y: headerYOffset)
					.blur(radius: headerBlurRadius)
					.onAppear {
						withAnimation(.EaseOutExpo(duration: exitAnimationConfig.durationSec).delay(1.0)) {
							headerOpacity = exitAnimationConfig.endOpacity
							headerYOffset = exitAnimationConfig.endOpacity
							headerBlurRadius = exitAnimationConfig.endBlurRadius
						}
					}
				VStack(alignment: .leading, spacing: -8) {
					InformationView(icon: "flag.circle.fill", heading: "Set Your Goal", description: "We’ll create a personalized goal based on your initial test.")
					InformationView(icon: "figure.run.circle.fill", heading: "Build Your Routine", description: "Get friendly reminders to make your goal a daily habit.")
					InformationView(icon: "trophy.circle.fill", heading: "Celebrate Your Achievement", description: "Reach your goal and enjoy the rewards. Well done!")
				}
				.opacity(informationOpacity)
				.offset(y: informationYOffset)
				.blur(radius: informationBlurRadius)
				.onAppear {
					withAnimation(.EaseOutExpo(duration: exitAnimationConfig.durationSec).delay(2.0)) {
						informationOpacity = exitAnimationConfig.endOpacity
						informationYOffset = exitAnimationConfig.endOpacity
						informationBlurRadius = exitAnimationConfig.endBlurRadius
					}
				}
			}
			Button(action: {
				onExit = true
			}) {
				ChatBubble(direction: .right) {
					Text("Sounds good!")
						.font(.body)
						.fontWeight(.medium)
						.padding(.vertical, 12)
						.padding(.leading, 12)
						.padding(.trailing, 16)
						.foregroundStyle(.background)
						.background(.accent)
				}
				.opacity(buttonOpacity)
				.offset(y: buttonYOffset)
				.onAppear {
					withAnimation(.EaseOutExpo(duration: exitAnimationConfig.durationSec).delay(4.0)) {
						buttonOpacity = exitAnimationConfig.endOpacity
						buttonYOffset = exitAnimationConfig.endYOffset
					}
				}
			}
		}
		.onChange(of: onExit) {
			if onExit {
				withAnimation(.EaseOutExpo(duration: 2.0)){
					headerOpacity = exitAnimationConfig.initOpacity
					headerYOffset = -exitAnimationConfig.initYOffset
					headerBlurRadius = exitAnimationConfig.initBlurRadius
				}
				
				withAnimation(.EaseOutExpo(duration: 2.0).delay(0.2)){
					informationOpacity = exitAnimationConfig.initOpacity
					informationYOffset = -exitAnimationConfig.initYOffset
					informationBlurRadius = exitAnimationConfig.initBlurRadius
				}
				
				withAnimation(.EaseOutExpo(duration: 2.0).delay(0.2)){
					buttonYOffset = -288
				}
				
				withAnimation(.EaseOutExpo(duration: 2.0).delay(1)){
					buttonOpacity = exitAnimationConfig.initOpacity
					buttonBlurRadius = exitAnimationConfig.initBlurRadius
				}
				
				DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
					currentSetupStep += 1
				}
			}
		}
    }
}

#Preview {
	TutorialView(currentSetupStep: .constant(1))
}
