//
//  InformationView.swift
//  100 Pushups
//
//  Created by Tom Kwok on 6/21/24.
//

import SwiftUI

struct InformationView: View {
	var icon: String
	var heading: String
	var description: String
	
    var body: some View {
		HStack(alignment: .center, spacing: 16) {
			Image(systemName: icon)
				.font(.system(size: 40))
				.fontWeight(.semibold)
				.foregroundStyle(.accent)
				.symbolRenderingMode(.hierarchical)
			VStack(alignment: .leading, spacing: 4) {
				Text(heading)
					.font(.headline)
					.foregroundStyle(.primary)
				Text(description)
					.font(.subheadline)
					.foregroundStyle(.secondary)
					.padding(.bottom, 12)
				Divider()
			}
		}
		.padding()
    }
}

#Preview("Information View", traits: .sizeThatFitsLayout) {
	InformationView(icon: "flag.circle.fill", heading: "Achieve and Celebrate", description: "Reach your goal and enjoy the rewards. Well done!")
}
