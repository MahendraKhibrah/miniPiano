//
//  ViewController.swift
//  miniPiano
//
//  Created by mahendra khibrah on 06/09/22.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func soundButton(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle!)
        sender.alpha=0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha=1.0
        }
    }
    
    var player: AVAudioPlayer?

    func playSound(soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

 
            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}


