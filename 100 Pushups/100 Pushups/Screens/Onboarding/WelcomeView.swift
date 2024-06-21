//
//  WelcomeView.swift
//  100 Pushups
//
//  Created by Tom Kwok on 6/21/24.
//

import SwiftUI

struct WelcomeView: View {
	@Binding var currentSetupStep: Int
	
	@State private var titleOpacity: Double = 0.0
	@State private var titleScale: CGFloat = 0.5
	@State private var titleXOffset: CGFloat = -48.0
	@State private var iconOpacity: Double = 0.0
	@State private var iconScale: CGFloat = 0.5
	@State private var iconXOffset: CGFloat = -48.0
	
	var title: String = "Welcome to"
	var subtitle: String = "100"
	var bodyText: String = "Log, track and celebrate your commitment for 100 days."
	
	
    var body: some View {
		VStack(alignment: .center, spacing: 24) {
			VStack(alignment: .leading, spacing: 16) {
				VStack(alignment: .leading, spacing: -8) {
					Text(title)
						.font(.system(size: 40))
						.fontWidth(.expanded)
						.fontWeight(.heavy)
						.kerning(-1)
					.foregroundStyle(.primary)
					Text(subtitle)
						.font(.system(size: 64))
						.fontWidth(.expanded)
						.fontWeight(.heavy)
						.kerning(-2)
						.foregroundStyle(.linearGradient(colors: [.grassGreen, .accentColor], startPoint: .leading, endPoint: .trailing))
				}
				Text(bodyText)
					.font(.body)
					.fontWidth(.expanded)
					.fontWeight(.regular)
					.foregroundStyle(.secondary)
			}
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
			.padding()
			
			Button(action: {
				currentSetupStep += 1
			}) {
				Image(systemName: "arrow.forward.circle.fill")
					.font(.system(size: 64, weight: .semibold))
					.foregroundStyle(.linearGradient(colors: [.grassGreen, .accentColor], startPoint: .leading, endPoint: .trailing))
					.opacity(iconOpacity)
					.offset(x: iconXOffset)
					.onAppear {
						withAnimation(.EaseOutExpo(duration: 2.0).delay(1.5)) {
							iconOpacity = 1.0
							iconXOffset = 0.0
						}
					}
				// TODO: Animation of a button fadeing out and offesting to the right
			}
			.padding()
		}
    }
}

#Preview {
	WelcomeView(currentSetupStep: .constant(0))
}
