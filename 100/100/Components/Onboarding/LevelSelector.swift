//
//  LevelSelector.swift
//  100
//
//  Created by Tom Kwok on 6/22/24.
//

import SwiftUI

struct LevelSelector: View {
	@AppStorage("fitnessLevel") private var fitnessLevel: FitnessLevel = .beginner
	@Environment(\.colorScheme) var colorScheme
	
	var color = Color.accentColor
	
	var body: some View {
		VStack {
			HStack(spacing: 0) {
				ForEach(FitnessLevel.allCases.indices, id: \.self) { index in
					let mode = FitnessLevel.allCases[index]
					let makeDivider = index < FitnessLevel.allCases.count - 1
					
					Button {
						fitnessLevel = mode
					} label: {
						VStack(spacing: 16) {
							Image(systemName: mode.imageName)
								.font(.largeTitle)
								.symbolRenderingMode(.hierarchical)
							Text(mode.title.uppercased())
								.font(.headline)
								.fontWidth(.condensed)
						}
						.frame(maxWidth: .infinity)
						.padding(4)
					}
					.foregroundStyle(mode == fitnessLevel ? color : .primary)
					
					if makeDivider {
						Divider()
							.frame(width: 0, height: 48)
					}
				}
			}
			.frame(maxWidth: .infinity)
			.padding()
			
			Text(fitnessLevel.description)
				.font(.footnote)
				.foregroundStyle(.secondary)
		}
    }
}

#Preview("Level Selctor", traits: .sizeThatFitsLayout) {
	LevelSelector()
}
