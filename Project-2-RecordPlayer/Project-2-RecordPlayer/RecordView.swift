//
//  RecordView.swift
//  Project-2-RecordPlayer
//
//  Created by Michael & Diana Pascucci on 7/17/22.
//

import SwiftUI

struct RecordView: View {
    
    // MARK: - PROPERTIES
    @Binding var degrees: Double
    @Binding var shouldAnimate: Bool
    
    // MARK: - BODY
    var body: some View {
        Image("record")
            .resizable()
            .frame(width: 275, height: 275, alignment: .center)
            .shadow(color: .gray, radius: 1, x: 0, y: 0)
            .rotationEffect(Angle.degrees(degrees))
            .animation(Animation.linear(duration: shouldAnimate ? 60 : 0).delay(1.5), value: shouldAnimate)
    }
}

// MARK: - PREVIEW
struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView(degrees: .constant(2.0), shouldAnimate: .constant(true))
    }
}
