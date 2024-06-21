//
//  SetUpProfileView.swift
//  100 Pushups
//
//  Created by Tom Kwok on 6/21/24.
//

import SwiftUI

struct SetUpProfileView: View {
	@Binding var currentSetupStep: Int
	
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
	SetUpProfileView(currentSetupStep: .constant(1))
}
