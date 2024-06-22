//
//  OnboardingHeader.swift
//  100 Pushups
//
//  Created by Tom Kwok on 6/21/24.
//

import SwiftUI

struct OnboardingHeader: View {
	// Title
	var title: String
	var titleSize: CGFloat = 40
	var titleForegroundStyle: any ShapeStyle = Color.primary
	// Title 2
	var title2: String
	var title2Size: CGFloat = 40
	var title2ForegroundStyle: any ShapeStyle = accentLinearGradient
	// Subtitle
	var subtitle: String?
	var subtitleFontWidth: Font.Width? = .expanded
	// Icon
	var icon: String?
	var iconStyle: any ShapeStyle = Color.primary
	@State private var showIcon: Bool = false
	
	
	var body: some View {
		HStack {
			VStack(alignment: .leading, spacing: 4) {
				Image(systemName: icon ?? "")
					.font(.system(size: titleSize))
					.fontWeight(.bold)
					.foregroundStyle(.accent)
				VStack(alignment: .leading, spacing: -4) {
					Text(title)
						.font(.system(size: 40))
						.fontWidth(.expanded)
						.fontWeight(.heavy)
						.kerning(-1)
						.foregroundStyle(titleForegroundStyle)
						
					Text(title2)
						.font(.system(size: title2Size))
						.fontWidth(.expanded)
						.fontWeight(.heavy)
						.kerning(-1)
						.foregroundStyle(title2ForegroundStyle)
				}
				Text(subtitle ?? "")
					.font(.body)
					.fontWidth(subtitleFontWidth)
					.foregroundStyle(.primary)
					.padding(.vertical)
			}
			Spacer()
		}
		.padding()
	}
}

#Preview("Onboarding Header", traits: .sizeThatFitsLayout) {
    OnboardingHeader(title: "Welcome to", title2: "100", subtitle: "Log, track and celebrate your commitment for 100 days.", icon: "rosette")
}
