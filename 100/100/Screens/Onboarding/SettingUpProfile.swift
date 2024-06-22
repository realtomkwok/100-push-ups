//
//  SettingUpProfile.swift
//  100 Pushups
//
//  Created by Tom Kwok on 6/21/24.
//

import SwiftUI

struct SettingUpProfile: View {
	@Binding var currentSetupStep: Int
	// TODO: Call UserProfileModel and specify them with values
	@AppStorage("fitnessLevel") private var fitnessLevel: FitnessLevel = .beginner

	@State private var onTransition: Bool = false
	@State private var hasName: Bool = false
	@State private var hasFitnessLevel: Bool = false
	@State private var onExit: Bool = false
	
	@State private var nameComponents = PersonNameComponents()
	
	let exitAnimationConfig = AnimationConfig(delaySec: 1.0)
	
	// Header
	@State private var headerOpacity: CGFloat = 0
	@State private var headerYOffset: CGFloat = 64
	@State private var headerBlurRadius: CGFloat = 10.0
	
	// Question 1
	@State private var q1Opacity: CGFloat = 0
	@State private var q1YOffset: CGFloat = 64
	@State private var q1BlurRadius: CGFloat = 10.0
	
	// Name Bubble
	@State private var nameBubbleOpacity: CGFloat = 0
	@State private var nameBubbleYOffset: CGFloat = 64
	@State private var nameBubbleBlurRadius: CGFloat = 10.0
	
	// Question 2
	@State private var q2Opacity: CGFloat = 0
	@State private var q2YOffset: CGFloat = 64
	@State private var q2BlurRadius: CGFloat = 10.0
	
	// Fitness Bubble
	@State private var fitnessBubbleOpacity: CGFloat = 0
	@State private var fitnesseBubbleYOffset: CGFloat = 64
	@State private var fitnessBubbleBlurRadius: CGFloat = 10.0
	

	var body: some View {
		VStack(alignment: .leading) {
			Group {
				// Stage 1: Header
				OnboardingHeader(title: "Leave", title2: "Your Mark", icon: "person.crop.circle.fill")
					.opacity(headerOpacity)
					.offset(y: headerYOffset)
					.blur(radius: headerBlurRadius)
					.onAppear {
						withAnimation(.EaseOutExpo(duration: exitAnimationConfig.durationSec)) {
							headerOpacity = exitAnimationConfig.endOpacity
							headerYOffset = exitAnimationConfig.endYOffset
							headerBlurRadius = exitAnimationConfig.endBlurRadius
						}
					}
				
				// Stage 2: Name
				// TODO: Fix the transistion
				if !hasName {
					VStack(alignment: .leading) {
						Text("What's your name?")
							.font(.callout)
							.fontWidth(.expanded)
						TextField("Your name", value: $nameComponents, format: .name(style: .medium))
							.autocorrectionDisabled(true)
							.font(.title)
							.textInputAutocapitalization(.words)
							.textContentType(.name)
							.submitLabel(.next)
							.onSubmit {
								withAnimation(.EaseOutExpo(duration: 2.0)) {
									onTransition = true
								}
							}
						Divider()
					}
					.padding()
					.opacity(q1Opacity)
					.offset(y: q1YOffset)
					.blur(radius: q1BlurRadius)
					.onAppear {
						withAnimation(.EaseOutExpo(duration: exitAnimationConfig.durationSec).delay(1.0)) {
							q1Opacity = exitAnimationConfig.endOpacity
							q1YOffset = exitAnimationConfig.endYOffset
							q1BlurRadius = exitAnimationConfig.endBlurRadius
						}
					}
				} else {
					ChatBubble(direction: .right) {
						Text("I'm " + nameComponents.formatted())
							.font(.body)
							.fontWeight(.medium)
							.padding(.vertical, 12)
							.padding(.leading, 12)
							.padding(.trailing, 16)
							.foregroundStyle(.background)
							.background(.accent)
					}
					.opacity(nameBubbleOpacity)
					.offset(y: nameBubbleYOffset)
					.blur(radius: nameBubbleBlurRadius)
					.onAppear() {
						withAnimation(.EaseOutExpo(duration: 2.0)){
							nameBubbleOpacity = exitAnimationConfig.endOpacity
							nameBubbleYOffset = exitAnimationConfig.endYOffset
							nameBubbleBlurRadius = exitAnimationConfig.endBlurRadius
						}
					}
				}
			}
			.onChange(of: onTransition) {
				withAnimation(.EaseOutExpo(duration: 2.0)) {
					headerYOffset = exitAnimationConfig.endYOffset
					q1Opacity = exitAnimationConfig.initOpacity
					q1YOffset = exitAnimationConfig.endYOffset - 64
					q1BlurRadius = exitAnimationConfig.initBlurRadius
				}
				onTransition = false
				
				DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
					hasName = true
				}
			}
					
			// Stage 3: Fitness Level
			// TODO: Select: Fitness Level (3)
			if hasName {
				VStack(alignment: .leading) {
					Text("How would you describe your current fitness level?")
						.font(.callout)
						.fontWidth(.expanded)
					LevelSelector()
				}
				.opacity(q2Opacity)
				.offset(y: q2YOffset)
				.blur(radius: q2BlurRadius)
				.padding()
				.onAppear {
					withAnimation(.EaseOutExpo(duration: 2.0).delay(1.0)) {
						q2Opacity = exitAnimationConfig.endOpacity
						q2YOffset = exitAnimationConfig.endYOffset
						q2BlurRadius = exitAnimationConfig.endBlurRadius
					}
				}
				Button(action: {
					onExit = true
				}) {
					ChatBubble(direction: .right) {
						Text("I\'m ready!")
							.font(.body)
							.fontWeight(.medium)
							.padding(.vertical, 12)
							.padding(.leading, 12)
							.padding(.trailing, 16)
							.foregroundStyle(.background)
							.background(.accent)
					}
				}
				.opacity(fitnessBubbleOpacity)
				.offset(y: fitnesseBubbleYOffset)
				.blur(radius: fitnessBubbleBlurRadius)
				.onAppear() {
					withAnimation(.EaseOutExpo(duration: 2.0).delay(4.0)){
						fitnessBubbleOpacity = exitAnimationConfig.endOpacity
						fitnesseBubbleYOffset = exitAnimationConfig.endYOffset
						fitnessBubbleBlurRadius = exitAnimationConfig.endBlurRadius
					}
				}
			}
			Spacer()
		}
		.onChange(of: onExit) {
			if onExit {
				withAnimation(.EaseOutExpo(duration: 2.0)){
					headerOpacity = exitAnimationConfig.initOpacity
					headerYOffset = -exitAnimationConfig.initYOffset
					headerBlurRadius = exitAnimationConfig.initBlurRadius
				}
				
				withAnimation(.EaseOutExpo(duration: 2.0)){
					q2Opacity = exitAnimationConfig.initOpacity
					q2YOffset = -exitAnimationConfig.initYOffset
					q2BlurRadius = exitAnimationConfig.initBlurRadius
				}
				
				withAnimation(.EaseOutExpo(duration: 2.0).delay(0.4)){
					nameBubbleOpacity = exitAnimationConfig.initOpacity
					nameBubbleBlurRadius = exitAnimationConfig.initBlurRadius
					fitnesseBubbleYOffset = -288
				}
				
				withAnimation(.EaseOutExpo(duration: 2.0).delay(1.5)){
					fitnessBubbleOpacity = exitAnimationConfig.initOpacity
					fitnessBubbleBlurRadius = exitAnimationConfig.initBlurRadius
				}
				
				DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
					currentSetupStep += 1
				}
			}
		}
	}
}

#Preview {
	SettingUpProfile(currentSetupStep: .constant(2))
}
