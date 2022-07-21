//
//  ContentView.swift
//  Project-8-AnimateTransitions
//
//  Created by Michael Pascucci on 7/21/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - BODY
    var body: some View {
        OpenSettingsView()
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - ANYTRANSITION EXTENSION
extension AnyTransition {
    static var fly: AnyTransition {
        get {
            AnyTransition.modifier(active: PresentAndDismiss(offsetValue: 0), identity: PresentAndDismiss(offsetValue: 1))
        }
    }
}
