//
//  StarView.swift
//  Project-12-StarryNight
//
//  Created by Michael & Diana Pascucci on 7/24/22.
//

import SwiftUI

struct Star: Shape {
    
    // MARK: - PROPERTIES
    let starPoints: Int
    var starThickness: CGFloat
    
    var animatableData: CGFloat {
        get { starThickness }
        set { starThickness = newValue }
    }
    
    // MARK: - PATH
    func path(in rect: CGRect) -> Path {
        // Make sure the star has at least 4 points
        guard starPoints >= 4 else { return Path() }
        
        // Create a X and Y point to start the drawing
        let drawPoint = CGPoint(x: rect.width / 1.2, y: rect.height / 0.5)
        
        // Make the angle of the star straight up (Change this to change the star angle)
        var starAngle = -CGFloat.pi / 2
        
        // Adjust the star angle based on how many points are chosen
        let adjustedStarAngle = .pi * 2 / CGFloat(starPoints * 2)
        
        // Adjust the inner X and Y points based on the star thickness
        let pointX = drawPoint.x * starThickness
        let pointY = drawPoint.y * starThickness
        
        // Create a Path instance to start drawing the star
        var path = Path()
        
        // Start the path off at the intial position
        path.move(to: CGPoint(x: drawPoint.x * cos(starAngle), y: drawPoint.y * sin(starAngle)))
        
        // Keep track of the lowest point so it can be centered
        var bottomEdge: CGFloat = 0
        
        // Loop over all the points and figure out the location of this point
        for corner in 0..<starPoints * 2 {
            let sinAngle = sin(starAngle)
            let cosAngle = cos(starAngle)
            let bottom: CGFloat
            
            // Check to see if this is a multiple of two
            if corner.isMultiple(of: 2) {
                // Outer Point - Store this position in bottom
                bottom = drawPoint.y * sinAngle
                
                // Add a line to that point
                path.addLine(to: CGPoint(x: drawPoint.x * cosAngle, y: bottom))
            } else {
                // Inner Point - Store this position in bottom
                bottom = pointY * sinAngle
                
                // Add a line to that point
                path.addLine(to: CGPoint(x: pointX * cosAngle, y: bottom))
            }
            
            // Check the bottom variable. If the new bottom is lower, store it in bottomEdge
            if bottom > bottomEdge {
                bottomEdge = bottom
            }
            
            // Move to the next corner
            starAngle += adjustedStarAngle
        }
        // Calculate how much unused space at the bottom of the drawing rectangle
        let bottomSpace = (rect.height / 2 - bottomEdge) / 2
        // Create and add a transform that moves the path down by that amount and centers the shape vertically
        let transform = CGAffineTransform(translationX: drawPoint.x, y: drawPoint.y + bottomSpace)
        return path.applying(transform)
    }
}
