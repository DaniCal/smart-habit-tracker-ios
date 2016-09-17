//
//  ViewController.swift
//  SmartHabitTracker
//
//  Created by Daniel Lohse on 9/16/16.
//  Copyright © 2016 Superstudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ActionChosenDelegate {

    //Mark properties
    
    @IBOutlet weak var actionTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showChooseActionView"){
            let chooseActionVC:ChooseActionViewController = segue.destination  as! ChooseActionViewController
            chooseActionVC.delegate = self
        }
        
    }
    
    func userDidChooseAction(selectedAction: Int) {
        print("You selected an action")
    }

    //Mark actions


}

