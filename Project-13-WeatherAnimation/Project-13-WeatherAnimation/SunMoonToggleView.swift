//
//  SunMoonToggleView.swift
//  Project-13-WeatherAnimation
//
//  Created by Michael & Diana Pascucci on 7/24/22.
//

import SwiftUI
import SunMoonToggleStyle

struct SunMoonToggleView: View {
    
    // MARK: - PROPERTIES
    @Binding var isOn: Bool
    
    // MARK: - BODY
    var body: some View {
        Toggle(isOn: $isOn, label: label)
            .toggleStyle(SunMoonToggleStyle())
            .padding(.horizontal, 134)
    }
    
    func label() -> Text {
        isOn ? Text("Moon").bold() : Text("Sun").bold()
    }
}

// MARK: - PREVIEW
struct SunMoonToggleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SunMoonToggleView(isOn: .constant(true))
                .previewLayout(.fixed(width: 200, height: 200))
            SunMoonToggleView(isOn: .constant(false))
                .previewLayout(.fixed(width: 200, height: 200))
        }
    }
}
