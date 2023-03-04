//
//  ViewController.swift
//  TheEggTimerApp
//
//  Created by Wynelher Tagayuna on 3/3/23.
//

import UIKit

class EggViewController: UIViewController {
    
    @IBOutlet weak var eggLabel: UILabel!
    @IBOutlet weak var eggTimerProgress: UIProgressView!
    
    var timer = Timer()
    var eggBrain = TheEggTimerBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func eggButtons(_ sender: UIButton) {
        timer.invalidate()//Stops egg timer when pressing new option

        eggBrain.getTime(sender, eggLabel)// Get time
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    }
    
    @objc func countDown(){
        if eggBrain.secondsPassed > 0{
            eggBrain.secondsPassed -= 1
            eggBrain.getProgress(eggBrain.secondsPassed, eggTimerProgress)//Update Progress Bar
        }else{
            eggBrain.getProgress(eggBrain.secondsPassed, eggTimerProgress)//Update Progress Bar
            eggLabel.text = "Done!"
            timer.invalidate()//Stops egg timer
        }
    }
}

