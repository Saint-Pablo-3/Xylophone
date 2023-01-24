//
//  ViewController.swift
//  Xylophone
//
//  Created by Pavel Reshetov on 24.01.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(forResource: sender.currentTitle!)
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { sender.alpha = 1.0 }
    }
    
    func playSound(forResource: String) {
        guard let url = Bundle.main.url(
            forResource: forResource,
            withExtension: "wav") else {
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch {
            print("sound error")
        }
        player?.play()
    }
    
}
