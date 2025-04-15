//
//  ColorsViewModel.swift
//  quotes
//
//  Created by Wilson Wei on 13/04/2025.
//

import Foundation
import SwiftUI

class ColorsViewModel: ObservableObject {
    @Published var colors = Colors.loadFromDefaults()
    
    func toggleDarkMode() {
        if colors.textColor == .white {
            Colors.saveToDefaults(mainCN: "white", textCN: "black")
        } else {
            Colors.saveToDefaults(mainCN: "black", textCN: "white")
        }
        colors = Colors.loadFromDefaults()
    }
}
