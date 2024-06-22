//
//  WelcomeView.swift
//  100 Pushups
//
//  Created by Tom Kwok on 6/21/24.
//

import SwiftUI

struct WelcomeView: View {
	@Binding var currentSetupStep: Int
	@State var onExit: Bool = false
	
	@State private var titleOpacity: Double = 0.0
	@State private var titleScale: CGFloat = 0.5
	@State private var titleXOffset: CGFloat = -48.0
	@State private var iconOpacity: Double = 0.0
	@State private var iconScale: CGFloat = 0.5
	@State private var iconXOffset: CGFloat = -48.0
	
	var title: String = "Welcome to"
	var title2: String = "100"
	var subtitle: String = "Log, track and celebrate your commitment for 100 days."
		
    var body: some View {
		VStack(alignment: .center) {
			VStack(alignment: .leading) {
				OnboardingHeader(title: title, title2: title2, title2Size: 64, subtitle: subtitle, subtitleFontWidth: .expanded)
			.opacity(titleOpacity)
			.scaleEffect(titleScale)
			.offset(x: titleXOffset)
			.onAppear {
				withAnimation(.EaseOutQuint(duration: 2.0)) {
					titleOpacity = 1.0
					titleScale = 1.0
					titleXOffset = 0.0
				}
			}
		}
			
			Button(action: {
				currentSetupStep += 1
				onExit = true
			}) {
				Image(systemName: "arrow.forward.circle.fill")
					.font(.system(size: 64, weight: .semibold))
					.foregroundStyle(.linearGradient(colors: [.grassGreen, .accentColor], startPoint: .leading, endPoint: .trailing))
					.opacity(iconOpacity)
					.offset(x: iconXOffset)
					.onAppear {
						withAnimation(.EaseOutExpo(duration: 2.0).delay(1.2)) {
							iconOpacity = 1.0
							iconXOffset = 0.0
						}
					}
			}
			.disabled(onExit)
			.padding()
		}
    }
}

#Preview {
	WelcomeView(currentSetupStep: .constant(0))
}
