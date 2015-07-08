//
//  ViewController.swift
//  roshambo
//
//  Created by Ricardo Hdz on 7/6/15.
//  Copyright (c) 2015 Ricardo Hdz. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
        Prepares segue and sets the ResultViewController properties
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! ResultViewController
        controller.playerValue = 2
        controller.machineValue = self.generatePlay()
    }
    
    /*
        Generate a random number between 1 - 3 to assign to paper, scissors, rock
        @return Int
    */
    func generatePlay() -> Int {
        // Generate a random Int32 using arc4Random
        let randomValue = 1 + arc4random() % 3
        
        // Return a more convenient Int, initialized with the random value
        return Int(randomValue)
    }
    
    /*
        Performs the segue for the paper button
        (Programatically)
    */
    @IBAction func playPaper() {
        var controller:ResultViewController
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
        controller.playerValue = 1
        controller.machineValue = self.generatePlay()
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    /*
        Performs the segue for the rock button
        (Code + Storyboard segue)
    */
    @IBAction func playRock() {
        self.performSegueWithIdentifier("playRock", sender: self)
    }

}

