//
//  ViewController.swift
//  tips
//wwwww
//  Created by serge kone Dossongui on 12/13/15.
//  Copyright © 2015 serge kone Dossongui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
     var tipPercentages = [0.18, 0.2, 0.22]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // used to determine whether any settings changed
       
        
       // tipControl.setTitle(FieldOne, forSegmentAtIndex: 0)
        

        

        //configure label
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
 
    
    
   override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
  
   

    
    //check if settings was called before the view appear
    if( animated == true){
        print("view will appear")
        
        
        
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let intZero  = defaults.integerForKey("ValueZero" )
        let intValueZero = defaults.integerForKey("IndexZero")
        
        let intOne  = defaults.integerForKey("ValueOne" )
        let intValueOne = defaults.integerForKey("IndexOne")
        
        let intTwo  = defaults.integerForKey("ValueTwo" )
        let intValueTwo = defaults.integerForKey("IndexTwo")
        
        
        
        
        //update the segment Control value
        tipControl.setTitle(String(format: "%%%d", intZero), forSegmentAtIndex: intValueZero)
        tipControl.setTitle(String(format: "%%%d", intOne), forSegmentAtIndex: intValueOne)
        tipControl.setTitle(String(format: "%%%d", intTwo), forSegmentAtIndex: intValueTwo)
     
        
        
        defaults.synchronize()
        
        //update the array of segment control value
        tipPercentages[0] = intZero._bridgeToObjectiveC().doubleValue/100
        tipPercentages[1] = intOne._bridgeToObjectiveC().doubleValue/100
        tipPercentages[2] = intTwo._bridgeToObjectiveC().doubleValue/100
        
        
       
    }
    
 
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        
        
   
       // let tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = billField.text!._bridgeToObjectiveC().doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    
    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }

}

