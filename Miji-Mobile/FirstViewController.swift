//
//  FirstViewController.swift
//  Miji-Mobile
//
//  Created by Panja on 3/27/16.
//  Copyright © 2016 Panja. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    //Inputs from Storyboard
    @IBOutlet weak var grabPN: UITextField!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var nextJobButton: UIButton!
    
    
    //Global Variables
    var pn = 0;
    var currentJob = "Nothing";
    var i = 0;
    var n = 0;
    var positions:Array = [""];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ShareData.sharedInstance.submitCheck = false;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Passing Positions to Admin Panel
    let shareData = ShareData.sharedInstance

    @IBAction func onPNSubmit(sender: AnyObject) {
        pn = Int(grabPN.text!)!;
        jobLabel.text = "Click Below";
        nextJobButton.hidden = false;
        n = 0;
        
        setupArray();
    }
    
    //Setup Array
    func setupArray(){
        positions = ["Murderer", "Judge", "Innocent", "Innocent"]; //Pre-set Positions
        if(pn == 5){
            positions += (["Co-Judge"]);
        }else if(pn == 6){
            positions += (["Innocent", "Co-Judge"]);
        }else if(pn == 7){
            positions += (["Murderer-2!", "Innocent", "Co-Judge"]);
        }else if(pn == 8){
            positions += (["Murderer-2!", "Innocent", "Co-Judge", "Angel"]);
        }else if(pn == 9){
            positions += (["Murderer-2", "Innocent", "Co-Judge", "Angel", "Innocent"]);
        }
        //Shuffle Job Order
        positions.shuffle();
        positions = positions.shuffle();
        print("\(positions)");
        
        self.shareData.positions = positions;
        for(var x = 0; x < positions.count; x++){
            self.shareData.positions[x] = positions[x];
        }
        ShareData.sharedInstance.submitCheck = true;
        // ^^ Pass data to the other class
        
        
    }
    
    @IBAction func onNextJobPress(sender: AnyObject) {
        positions = self.shareData.positions;
        if(i == 0){
            i = 1;
            if !(n + 1 > positions.count){
                jobLabel.text = "Click Below";
                nextJobButton.setTitle("Next", forState: UIControlState.Normal);
            }else{
                jobLabel.text = "Done";
                nextJobButton.hidden = true;
            }
        }else{
            nextJobButton.setTitle("Hide", forState: UIControlState.Normal);
            i = 0;
            
            if !(n + 1 > positions.count){
                jobLabel.text = positions[n];
                n++;
            }else{
                jobLabel.text = "Done";
                nextJobButton.hidden = true;
            }
        }
    }
}
//Randomizers

extension CollectionType {
    /// Return a copy of `self` with its elements shuffled
    func shuffle() -> [Generator.Element] {
        var positions = Array(self)
        positions.shuffleInPlace()
        return positions
    }
}

extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}


