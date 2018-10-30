//
//  PlaySoundsViewController.swift
//  VoiceModuler
//
//  Created by Gabriel de Freitas Meira on 14/10/2018.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var recordedAudioURL: URL!
    
    @IBOutlet weak var echoB: UIButton!
    @IBOutlet weak var reverbB: UIButton!
    @IBOutlet weak var highB: UIButton!
    @IBOutlet weak var lowB: UIButton!
    @IBOutlet weak var slowB: UIButton!
    @IBOutlet weak var fastB: UIButton!
    @IBOutlet weak var stopB: UIButton!
    
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, high, low, echo, reverb
    }
    
    @IBAction func playForButton(_ sender: UIButton) {
        
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .high:
            playSound(pitch: 1000)
        case .low:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopPressed(_ sender: Any) {
        stopAudio()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }

}
