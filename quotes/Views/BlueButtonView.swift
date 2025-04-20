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
        HStack {
            Text(text)
                .bold()
                .padding()
                .background(Color.cyan)
                .cornerRadius(10)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    BlueButtonView(text: "Hello World!")
}
