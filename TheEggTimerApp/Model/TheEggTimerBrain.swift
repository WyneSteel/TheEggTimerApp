//
//  TheEggTimerBrain.swift
//  TheEggTimerApp
//
//  Created by Wynelher Tagayuna on 3/4/23.
//

import Foundation
import UIKit

struct TheEggTimerBrain{
    let eggCookTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var secondsPassed = 0
    var completeTime = 0
    
    // Get Time
    mutating func getTime(_ button: UIButton, _ label: UILabel){
        if let eggKey = button.titleLabel?.text{
            label.text = "\(eggKey) Egg"
            secondsPassed = eggCookTimes[eggKey] ?? 0
            completeTime = secondsPassed
        }
    }
    
    //Update Progress Bar
    mutating func getProgress(_ time: Int, _ timeProgress: UIProgressView){
        let theProgress = Float(time)/Float(completeTime)
        timeProgress.progress = theProgress
    }
}
