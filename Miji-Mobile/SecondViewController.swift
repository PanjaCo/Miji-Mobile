//
//  SecondViewController.swift
//  Miji-Mobile
//
//  Created by Panja on 3/27/16.
//  Copyright © 2016 Panja. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    //Inputs from Storyboard
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var submitPassword: UIButton!

    //Table
    @IBOutlet weak var One: UITextField!
    @IBOutlet weak var Two: UITextField!
    @IBOutlet weak var Three: UITextField!
    @IBOutlet weak var Four: UITextField!
    @IBOutlet weak var Five: UITextField!
    @IBOutlet weak var Six: UITextField!
    @IBOutlet weak var Seven: UITextField!
    @IBOutlet weak var Eight: UITextField!
    @IBOutlet weak var Nine: UITextField!
    //Table Number Labels
    @IBOutlet weak var First: UILabel!
    @IBOutlet weak var Second: UILabel!
    @IBOutlet weak var Third: UILabel!
    @IBOutlet weak var Fourth: UILabel!
    @IBOutlet weak var Fifth: UILabel!
    @IBOutlet weak var Sixth: UILabel!
    @IBOutlet weak var Seventh: UILabel!
    @IBOutlet weak var Eighth: UILabel!
    @IBOutlet weak var Ninth: UILabel!
    
    //Bottom Row Buttons
    @IBOutlet weak var Lock: UIButton!
    
    @IBOutlet weak var submitCorrections: UIButton!
    @IBOutlet weak var Reload: UIButton!
    
    //Variables
    let shareData = ShareData.sharedInstance
    
    var positions:Array = [""]
    //ShareData.sharedInstance.positions;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Set Buttons Invisible
        Lock.hidden = true;
        submitCorrections.hidden = true;
        Reload.hidden = true;
        
        let submitCheck = self.shareData.submitCheck;
        if(submitCheck == true){
            positions = self.shareData.positions;
            
            print(positions);
            setFields();
        }
        
        
        //Set Text Field's Invisible
        One.hidden = true;
        Two.hidden = true;
        Three.hidden = true;
        Four.hidden = true;
        Five.hidden = true;
        Six.hidden = true;
        Seven.hidden = true;
        Eight.hidden = true;
        Nine.hidden = true;
        //Set Text Field Label's Invisible
        First.hidden = true;
        Second.hidden = true;
        Third.hidden = true;
        Fourth.hidden = true;
        Fifth.hidden = true;
        Sixth.hidden = true;
        Seventh.hidden = true;
        Eighth.hidden = true;
        Ninth.hidden = true;
        
    }
    func setFields(){
        //Set Text Fields
        
        print(positions.count);
        
        One.text = positions[0];
        Two.text = positions[1];
        Three.text = positions[2];
        Four.text = positions[3];
        if !(4 >= positions.count){
            Five.text = positions[4];
        }
        if !(5 >= positions.count){
            Six.text = positions[5];
        }
        if !(6 >= positions.count){
            Seven.text = positions[6];
        }
        if !(7 >= positions.count){
            Eight.text = positions[7];
        }
        if !(8 >= positions.count){
            Nine.text = positions[8];
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Admin Panel
    @IBAction func tryPassword(sender: AnyObject) {
        if(password.text == "admin"){
            //Show all admin panel content
            password.hidden = true;
            submitPassword.hidden = true;
            
            
            //Set Buttons Visible
            Lock.hidden = false;
            submitCorrections.hidden = false;
            Reload.hidden = false;
            
            //Set Text Field's Visible
            One.hidden = false;
            Two.hidden = false;
            Three.hidden = false;
            Four.hidden = false;
            Five.hidden = false;
            Six.hidden = false;
            Seven.hidden = false;
            Eight.hidden = false;
            Nine.hidden = false;
            
            //Set Text Field Label's Visible
            First.hidden = false;
            Second.hidden = false;
            Third.hidden = false;
            Fourth.hidden = false;
            Fifth.hidden = false;
            Sixth.hidden = false;
            Seventh.hidden = false;
            Eighth.hidden = false;
            Ninth.hidden = false;
            
        }else{
            //Display an error message
        }
        password.text = "";
    }
    
    @IBAction func onLock(sender: AnyObject) {
        password.hidden = false;
        submitPassword.hidden = false;
        
        //Set Buttons Invisible
        Lock.hidden = true;
        submitCorrections.hidden = true;
        Reload.hidden = true;
        //Set Text Field's Invisible
        One.hidden = true;
        Two.hidden = true;
        Three.hidden = true;
        Four.hidden = true;
        Five.hidden = true;
        Six.hidden = true;
        Seven.hidden = true;
        Eight.hidden = true;
        Nine.hidden = true;
        //Set Text Field Label's Invisible
        First.hidden = true;
        Second.hidden = true;
        Third.hidden = true;
        Fourth.hidden = true;
        Fifth.hidden = true;
        Sixth.hidden = true;
        Seventh.hidden = true;
        Eighth.hidden = true;
        Ninth.hidden = true;
        
        
        
    }
    @IBAction func onCorrectionSubmit(sender: AnyObject) {
        positions[0] = String(One.text!);
        positions[1] = String(Two.text!);
        positions[2] = String(Three.text!);
        positions[3] = String(Four.text!);
        if !(5 >= positions.count){
            positions[4] = String(Five.text!);
        }
        if !(6 >= positions.count){
            positions[5] = String(Six.text!);
        }
        if !(7 >= positions.count){
            positions[6] = String(Seven.text!);
        }
        if !(8 >= positions.count){
            positions[7] = String(Eight.text!);
        }
        if !(9 >= positions.count){
            positions[8] = String(Nine.text!);
        }
        //Send to the other file
        self.shareData.positions[0] = positions[0]
        self.shareData.positions[1] = positions[1]
        self.shareData.positions[2] = positions[2]
        self.shareData.positions[3] = positions[3]
        if !(5 >= positions.count){
            self.shareData.positions[4] = positions[4]
        }
        if !(6 >= positions.count){
            self.shareData.positions[5] = positions[5]
        }
        if !(7 >= positions.count){
            self.shareData.positions[6] = positions[6]
        }
        if !(8 >= positions.count){
            self.shareData.positions[7] = positions[7]
        }
        if !(9 >= positions.count){
            self.shareData.positions[8] = positions[8]
        }
        
        /*for(var x = 0; x < positions.count; x++){
            self.shareData.positions[x] = positions[x];
        }*/
    }
    @IBAction func onReload(sender: AnyObject) {
        setFields();
    }
    
    
    
    
}

