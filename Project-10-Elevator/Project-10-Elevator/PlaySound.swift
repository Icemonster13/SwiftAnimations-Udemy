//
//  PlaySound.swift
//  Project-10-Elevator
//
//  Created by Michael & Diana Pascucci on 7/23/22.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Error: Could not find or play the sound file!")
        }
    }
    
}

