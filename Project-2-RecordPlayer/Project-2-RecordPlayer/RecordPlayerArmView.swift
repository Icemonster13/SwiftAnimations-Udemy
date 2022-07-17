//
//  RecordPlayerArm.swift
//  Project-2-RecordPlayer
//
//  Created by Michael & Diana Pascucci on 7/17/22.
//

import SwiftUI

struct RecordPlayerArmView: View {
    
    // MARK: - PROPERTIES
    @Binding var rotateArm: Bool
    
    // MARK: - BODY
    var body: some View {
        Image("playerArm")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150, alignment: .center)
            .shadow(color: .gray, radius: 2, x: 0, y: 0)
            .rotationEffect(Angle.degrees(-35), anchor: .topTrailing)
            .rotationEffect(Angle.degrees(rotateArm ? 8 : 0), anchor: .topTrailing)
            .animation(Animation.linear(duration: 2), value: rotateArm)
            .offset(x: 70, y: -250)
    }
}

// MARK: - PREVIEW
struct RecordPlayerArm_Previews: PreviewProvider {
    static var previews: some View {
        RecordPlayerArmView(rotateArm: .constant(true))
    }
}
