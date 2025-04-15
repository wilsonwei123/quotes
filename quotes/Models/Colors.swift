//
//  Colors.swift
//  quotes
//
//  Created by Wilson Wei on 13/04/2025.
//

import Foundation
import SwiftUI

struct Colors {
    var mainColor: Color
    var textColor: Color
    
    static func loadFromDefaults() -> Colors {
        let mainName = UserDefaults.standard.string(forKey: "mainColorName") ?? "white"
        let textName = UserDefaults.standard.string(forKey: "textColorName") ?? "black"

        return Colors(
            mainColor: mainName == "black" ? .black : .white,
            textColor: textName == "white" ? .white : .black
        )
    }

    static func saveToDefaults(mainCN: String, textCN: String) {
        UserDefaults.standard.set(mainCN, forKey: "mainColorName")
        UserDefaults.standard.set(textCN, forKey: "textColorName")
    }
}
