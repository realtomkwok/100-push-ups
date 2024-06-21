//
//  SetUpProfileView.swift
//  100 Pushups
//
//  Created by Tom Kwok on 6/21/24.
//

import SwiftUI

struct SetUpProfileView: View {
	@Binding var currentSetupStep: Int
	
	var title: String = "Easy as"
	var subtitle: String = "1-2-3"
	
    var body: some View {
		VStack {
			OnboardingHeader(title: "Easy as", subtitle: "1-2-3", subtitleSize: 64, icon: "trophy")
		}
		.padding()
    }
}

#Preview {
	SetUpProfileView(currentSetupStep: .constant(1))
}
