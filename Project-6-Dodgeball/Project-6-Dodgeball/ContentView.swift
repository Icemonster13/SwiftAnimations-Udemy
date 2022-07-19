//
//  ContentView.swift
//  Project-6-Dodgeball
//
//  Created by Michael Pascucci on 7/19/22.
//

import SwiftUI
import SpriteKit

// MARK: - SKScene Class
class GameScene: SKScene {
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }
    
    // Manages a single touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let ball = SKSpriteNode(imageNamed: "dodgeBall")
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.7)
        ball.physicsBody?.restitution = 0.4
        ball.position = location
        addChild(ball)
    }
    
    // Manages a moving touch
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let ball = SKSpriteNode(imageNamed: "dodgeBall")
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2.7)
        ball.physicsBody?.restitution = 0.4
        ball.position = location
        addChild(ball)
    }
}

struct ContentView: View {
    
    // MARK: - PROPERTIES
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(
            width: UIScreen.main.bounds.size.width,
            height: UIScreen.main.bounds.size.height)
        return scene
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            
            // Background
            LinearGradient(
                gradient: Gradient(colors: [.black, .white.opacity(0.8), .black]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            // Foreground
            VStack {
                SpriteView(scene: scene)
                    .frame(width: 320, height: 650, alignment: .center)
            }
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
