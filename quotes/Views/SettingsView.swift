//
//  SettingsView.swift
//  quotes
//
//  Created by Wilson Wei on 14/04/2025.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var colorsVM: ColorsViewModel
    @State var darkModeOn = UserDefaults.standard.bool(forKey: "darkModeOn") ?? false

    var body: some View {
        ZStack {
            colorsVM.colors.mainColor.ignoresSafeArea()
            VStack {
                Toggle(isOn: $darkModeOn) {
                    Text("Toggle dark mode")
                        .font(.title2)
                }
                .padding()
                .onChange(of: darkModeOn) { newValue in
                    colorsVM.toggleDarkMode()
                    UserDefaults.standard.set(newValue, forKey: "darkModeOn")
                }
                Spacer()
            }
            .foregroundStyle(colorsVM.colors.textColor)
        }
        .navigationTitle(Text("Settings"))
    }
}

#Preview {
    SettingsView(colorsVM: ColorsViewModel())
}
