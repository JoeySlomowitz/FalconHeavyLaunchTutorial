//
//  ViewController.swift
//  FalconHeavyLaunch
//
//  Created by Joey Slomowitz on 13/3/18.
//  Copyright © 2018 Joey Slomowitz. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var launchButtonView: UIButton!
    @IBOutlet weak var falconHeavyImage: UIImageView!
    @IBOutlet weak var resetButtonView: UIButton!
    
    var player: AVAudioPlayer?
    
    @IBAction func launchButton(_ sender: UIButton) {
        
        launchRocket()
    }
    
    @IBAction func resetButtonPresed(_ sender: UIButton) {
        
        self.falconHeavyImage.layer.removeAllAnimations()
        self.falconHeavyImage.center.y = 1000
        
        UIView.animate(withDuration: 1) {
            self.falconHeavyImage.center.y = 660.5
        }
        
        launchButtonView.alpha = 0.6
        player = nil
    }
    
    
    func launchRocket() {
        
        let startingYPosition = self.falconHeavyImage.center.y
        
        guard self.falconHeavyImage.center.y == startingYPosition else { return }
        self.launchButtonView.alpha = 0
        playRocketSound()
        
        
        UIView.animate(withDuration: 11) {
            self.falconHeavyImage.center.y = -startingYPosition
        }
    }

    func playRocketSound() {
        guard let url = Bundle.main.url(forResource: "FalconHeavySound", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(falconHeavyImage.center.y)
    }
    
}

