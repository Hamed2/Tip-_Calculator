//
//  SettingsViewController.swift
//  tips
//
//  Created by serge kone Dossongui on 12/14/15.
//  Copyright © 2015 serge kone Dossongui. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

 

    
    
    @IBOutlet weak var tipControlSettings: UISegmentedControl!
    @IBOutlet weak var tipValueField: UITextField!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
       tipValueField.text = "%18"
        
        
        
        //let tipInit = "0.19"
        //let defaults = NSUserDefaults.standardUserDefaults()
        //defaults.setObject(tipInit,forKey: "percent1")
        //defaults.synchronize()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

       /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func valueInFieldWasEntered(sender: AnyObject) {
        
        
        //read value enter in the field
        let tipPercentAmount = tipValueField.text!._bridgeToObjectiveC().integerValue
        
        //set format to display on segment control
        tipValueField.text = String(format: "%%%d", tipPercentAmount)
        
       //display value selected on segment control
        tipControlSettings.setTitle(tipValueField.text, forSegmentAtIndex: tipControlSettings.selectedSegmentIndex)
        
       
        if(tipControlSettings.selectedSegmentIndex==0)
        {
          let  keyS = "ValueZero"
          let keyI = "IndexZero"
            
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setInteger(tipPercentAmount,forKey: keyS)
            defaults.setInteger(tipControlSettings.selectedSegmentIndex, forKey: keyI)
            defaults.synchronize()
            
            
            //UpdateSettings(tipValueField.text!, tipLabelIndex: tipControlSettings.selectedSegmentIndex)
               }
        
        if(tipControlSettings.selectedSegmentIndex==1)
        {
            let  keyS = "ValueOne"
            let keyI = "IndexOne"
            
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setInteger(tipPercentAmount,forKey: keyS)
            defaults.setInteger(tipControlSettings.selectedSegmentIndex, forKey: keyI)
            defaults.synchronize()
            
            
            //UpdateSettings(tipValueField.text!, tipLabelIndex: tipControlSettings.selectedSegmentIndex)
        }
        
        if(tipControlSettings.selectedSegmentIndex==2)
        {
            let  keyS = "ValueTwo"
            let keyI = "IndexTwo"
            
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setInteger(tipPercentAmount,forKey: keyS)
            defaults.setInteger(tipControlSettings.selectedSegmentIndex, forKey: keyI)
            defaults.synchronize()
            
            
            //UpdateSettings(tipValueField.text!, tipLabelIndex: tipControlSettings.selectedSegmentIndex)
        }

        
        
        
        
        
    }
    
    /*func UpdateSettings(tipLabelValue: String, tipLabelIndex: Int, keyValueS: String, keyValueI: String ) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(tipLabelValue,forKey: keyValueS)
        defaults.setInteger(tipLabelIndex, forKey: keyValueI)
        defaults.synchronize()
        
        
    }*/
    

}
