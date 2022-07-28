//
//  ContentView.swift
//  Project-14-GearsAndBelts
//
//  Created by Michael Pascucci on 7/25/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            // Motor - Z Axis Rotation
            ZStack {
                Image("motor")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, height: 120)
                    .offset(x: -120, y: 90)
                
                // Motor Gear 1
                GearView(gearImage: "doubleGear", gearWidth: 40, gearDegrees: 360, offsetGearX: -124, offsetGearY: 102, duration: 5)
                // Top Left Gear
                GearView(gearImage: "doubleGear", gearWidth: 100, gearDegrees: 360, offsetGearX: -124, offsetGearY: -280, duration: 7)
            }
            
            ZStack {
                // Top Belt
                BeltView(animateBelt: true, beltWidth: 352, beltHeight: 100, offsetBeltX: 0, offsetBeltY: -280, dashPhaseValue: -360, rotateDegrees: 0)
                
                // Top Right Gear
                GearView(gearImage: "doubleGear", gearWidth: 100, gearDegrees: 360, offsetGearX: 124, offsetGearY: -280, duration: 7)
            }
            
            ZStack {
                // Middle Right Gear
                GearView(gearImage: "doubleGear", gearWidth: 100, gearDegrees: 360, offsetGearX: 124, offsetGearY: -70, duration: 5)
                
                // Middle Second Gear From Right
                GearView(gearImage: "doubleGear", gearWidth: 80, gearDegrees: -360, offsetGearX: 49, offsetGearY: -113, duration: 5)
                
                // Middle Third Gear From Right
                GearView(gearImage: "doubleGear", gearWidth: 100, gearDegrees: 360, offsetGearX: -6, offsetGearY: -80, duration: 6)
            }
            
            ZStack {
                // Belt 1 For The Motor - Long Belt Left Side
                BeltView(animateBelt: true, beltWidth: 425, beltHeight: 48, offsetBeltX: -124, offsetBeltY: -90, dashPhaseValue: -360, rotateDegrees: 90)
                
                // Belt 2 - Short Belt Right Side
                BeltView(animateBelt: true, beltWidth: 258, beltHeight: 48, offsetBeltX: 124, offsetBeltY: -175, dashPhaseValue: -360, rotateDegrees: 90)
            }
            
            ZStack {
                // Middle Fourth From The Right
                GearView(gearImage: "singleGear", gearWidth: 100, gearDegrees: -360, offsetGearX: -62, offsetGearY: -85, rotateDegrees: 79, duration: 7, xAxis: 0, yAxis: 1, zAxis: 0)
                
                // Middle Small Belt
                BeltView(animateBelt: true, beltWidth: 22, beltHeight: 120, dashPhaseValue: -40)
                    .rotation3DEffect(Angle.degrees(70), axis: (x: 0, y: 1, z: 0))
                    .offset(x: -60, y: -33)
                
                // Bottom Right Gear
                GearView(gearImage: "singleGear", gearWidth: 100, gearDegrees: -360, offsetGearX: 160, offsetGearY: 94, rotateDegrees: 79, duration: 7, xAxis: 0, yAxis: 1, zAxis: 0)
                
                // Bottom Right Small Belt
                BeltView(animateBelt: true, beltWidth: 22, beltHeight: 170, offsetBeltX: 0, offsetBeltY: -10, dashPhaseValue: -40, rotateDegrees: 0)
                    .rotation3DEffect(Angle.degrees(70), axis: (x: 0, y: 1, z: 0))
                    .offset(x: 162, y: 185)
                
                // Bottom Shaft
                ShaftView(width: 170)
                    .offset(x: 95, y: 260)
            }
            
            ZStack {
                // Worm Gear
                WormGearView()
                    .offset(x: 60, y: 30)
                
                // Middle Y Axis Gear
                GearView(gearImage: "singleGear", gearWidth: 175, gearDegrees: 360, offsetGearX: 60, offsetGearY: 39, rotateDegrees: 84, duration: 7, xAxis: 1, yAxis: 0, zAxis: 0)
                
                // Shaft Connecting To the Worm and Belt
                ShaftView(width: 120)
                    .offset(x: -13, y: 30)
            }
            
            // Fan
            FanView()
                .offset(x: 0, y: 250)
                .frame(width: 140, height: 140, alignment: .center)
        }
        
        .background(
            Image("goldBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 400, height: 1000, alignment: .center))
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
