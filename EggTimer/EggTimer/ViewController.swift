//
//  ViewController.swift
//  EggTimer
//
//  Created by Mahoto Sasaki on 6/4/20.
//  Copyright © 2020 mo3aru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var EggLabel: UILabel!

    let eggTimes = ["Soft": 5,"Medium": 6, "Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    

    @IBAction func eggButtonPressed(_ sender: UIButton) {
        secondsPassed = 0
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        if secondsPassed < totalTime {
            secondsPassed+=1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            EggLabel.text = "Done"
        }
    }
}

