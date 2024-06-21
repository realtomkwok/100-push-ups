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
	// Subtitle
	var subtitle: String
	var subtitleSize: CGFloat = 40
	var subtitleForegroundStyle: any ShapeStyle = .linearGradient(colors: [.grassGreen, .accentColor], startPoint: .leading, endPoint: .trailing)
	// Others
	var icon: String?
	var spacing: CGFloat = -4
	
	var body: some View {
		VStack(alignment: .leading, spacing: 16) {
			if let icon = icon {
				Image(systemName: icon)
					.font(.system(size: titleSize))
					.fontWeight(.bold)
			}
			VStack(alignment: .leading, spacing: spacing) {
				Text(title)
					.font(.system(size: 40))
					.fontWidth(.expanded)
					.fontWeight(.heavy)
					.kerning(-1)
					.foregroundStyle(titleForegroundStyle)
				Text(subtitle)
					.font(.system(size: subtitleSize))
					.fontWidth(.expanded)
					.fontWeight(.heavy)
					.kerning(-1)
					.foregroundStyle(subtitleForegroundStyle)
			}
		}
	}
}

#Preview {
    OnboardingHeader(title: "Title", subtitle: "Subtitle", icon: "rosette")
}
