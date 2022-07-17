//
//  RecordPlayerBox.swift
//  Project-2-RecordPlayer
//
//  Created by Michael & Diana Pascucci on 7/17/22.
//

import SwiftUI

struct RecordPlayerBoxView: View {
    
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 345, height: 345, alignment: .center)
                .cornerRadius(10)
            Image("woodGrain")
                .resizable()
                .frame(width: 325, height: 325, alignment: .center)
                .shadow(color: .white, radius: 3, x: 0, y: 0)
        }
    }
}

// MARK: - PREVIEW
struct RecordPlayerBox_Previews: PreviewProvider {
    static var previews: some View {
        RecordPlayerBoxView()
    }
}
