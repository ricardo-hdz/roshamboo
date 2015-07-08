//
//  ResultViewController.swift
//  
//
//  Created by Ricardo Hdz on 7/6/15.
//
//

import Foundation
import UIKit


class ResultViewController: UIViewController {
    
    var playerValue: Int?
    var machineValue: Int?
    
    // Paper == 1
    // Rock == 2
    // Scissors == 3
    
    @IBOutlet var resultImage: UIImageView!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        setResult()
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.3) {
            self.resultLabel.alpha = 1
            self.resultImage.alpha = 1
        }
    }
    
    /*
        Sets the results of the match based on the player/machine values
        TODO: Refactor to switch statement
    */
    func setResult() {
        var imageName: String?
        var result: String?
        
        if let playerValue = self.playerValue, let machineValue = self.machineValue {
            if playerValue == machineValue {
                imageName = "itsATie"
                result = "It's a tie!"
            } else if playerValue == 1 && machineValue == 2 {
                imageName = "PaperCoversRock"
                result = "You win! Paper covers Rock"
            } else if playerValue == 2 && machineValue == 1 {
                imageName = "PaperCoversRock"
                result = "You lose! Paper covers Rock"
            } else if playerValue == 2 && machineValue == 3 {
                imageName = "RockCrushesScissors"
                result = "You win! Rock Crushes Scissors"
            } else if playerValue == 3 && machineValue == 2 {
                imageName = "RockCrushesScissors"
                result = "You lose! Rock Crushes Scissors"
            } else if playerValue == 3 && machineValue == 1 {
                imageName = "ScissorsCutPaper"
                result = "You win! Scissors Cut Paper"
            } else if playerValue == 1 && machineValue == 3 {
                imageName = "ScissorsCutPaper"
                result = "You lose! Scissors Cut Paper"
            }
        }
        
        // Assign values to outlets
        self.resultImage.image = UIImage(named: "\(imageName!)")
        self.resultLabel.text = result
        
        self.resultLabel.alpha = 0
        self.resultImage.alpha = 0
    }
    
    @IBAction func playAgain() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}