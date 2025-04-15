//
//  BlueButtonView.swift
//  quotes
//
//  Created by Wilson Wei on 15/04/2025.
//

import SwiftUI

struct BlueButtonView: View {
    let text: String
    var body: some View {
        Text(text)
            .bold()
            .padding()
            .background(Color.cyan)
            .cornerRadius(10)
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    BlueButtonView(text: "Hello World!")
}
